# frozen_string_literal: true

module TransactionsManager
  # This interactor looks for the client in the database.
  # If it doesn't exist, then it looks for it in the Increase API and then creates it.
  class FindOrCreateClient
    include Interactor

    def call
      client_id = context.registry['client_id']

      return if Client.where(id: client_id).any?

      api_client = TransactionApi::V1::Client.new(ENV['BEARER_TOKEN'])
      params = api_client.transaction_client(client_id)
      client = Client.create!(
        id: client_id,
        email: params['email'],
        first_name: params['first_name'],
        last_name: params['last_name'],
        job: params['job'],
        country: params['country'],
        address: params['address'],
        zip_code: params['zip_code'],
        phone: params['phone']
      )
      context.client_id = client_id
      context.client_exist = client.valid?
    end
  end
end
