# frozen_string_literal: true

require 'tempfile'
module TransactionApi
  module V1
    # Increase api wrapping client
    class Client
      include HttpStatusCodes
      include ApiExceptions

      API_ENDPOINT = 'https://increase-transactions.herokuapp.com'
      API_REQUSTS_QUOTA_REACHED_MESSAGE = 'API rate limit exceeded'

      attr_reader :oauth_token

      def initialize(oauth_token)
        @oauth_token = oauth_token
      end

      def transaction_client(client_id)
        response = request(
          http_method: :get,
          endpoint: "clients/#{client_id}"
        )

        response_body = response.body
        parsed_response = Oj.load(response_body)

        return parsed_response if response_successful?(response)

        raise error_class(response), "Code: #{response.status}, response: #{response_body}"
      end

      def transaction_file
        response = request(
          http_method: :get,
          endpoint: '/file.txt'
        )

        response_body = response.body
        return response_body if response_successful?(response)

        raise error_class(response), "Code: #{response.status}, response: #{response_body}"
      end

      private

      def client
        @client ||= Faraday.new(API_ENDPOINT) do |client|
          client.request :url_encoded
          client.adapter Faraday.default_adapter
          client.headers['Authorization'] = "Bearer #{oauth_token}" if oauth_token.present?
        end
      end

      def request(http_method:, endpoint:, params: {})
        response = client.public_send(http_method, endpoint, params)

        return response if response_successful?(response)

        raise error_class(response), "Code: #{response.status}, response: #{response.body}"
      end

      def error_class(response)
        case response.status
        when HTTP_BAD_REQUEST_CODE
          BadRequestError
        when HTTP_UNAUTHORIZED_CODE
          UnauthorizedError
        when HTTP_FORBIDDEN_CODE
          return ApiRequestsQuotaReachedError if api_requests_quota_reached?(response)

          ForbiddenError
        when HTTP_NOT_FOUND_CODE
          NotFoundError
        when HTTP_UNPROCESSABLE_ENTITY_CODE
          UnprocessableEntityError
        else
          ApiError
        end
      end

      def response_successful?(response)
        response.status == HTTP_OK_CODE
      end

      def api_requests_quota_reached?(response)
        response.body.match?(API_REQUSTS_QUOTA_REACHED_MESSAGE)
      end
    end
  end
end
