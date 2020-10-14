module TransactionApi
  module V1
    class Client
      API_ENDPOINT = 'https://increase-transactions.herokuapp.com'.freeze

      attr_reader :oauth_token
      
      def initialize(oauth_token = nil)
        @oauth_token = oauth_token
      end
      
      def transaction_client(client_id)
        request(
          http_method: :get,
          endpoint: "clients/#{client_id}"
        )
      end

      def transaction_file
        request(
          http_method: :get,
          endpoint: '/file.txt'
        )
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
        Oj.load_file(response.body)
      end
    end  
  end  
end
