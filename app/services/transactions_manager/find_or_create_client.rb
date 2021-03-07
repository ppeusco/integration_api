module TransactionsManager
  class FindOrCreateClient
    include Interactor
    
    def call
      context.client_id = context.registry['client_id']

      return if Client.where(id: context.client_id).any?

      api_client = TransactionApi::V1::Client.new
      params = api_client.transaction_client(context.client_id)
      client = Client.create!(
        id: context.client_id,
        email: params['email'],
        first_name: params['first_name'],
        last_name: params['last_name'],
        job: params['job'],
        country: params['country'],
        address: params['address'],
        zip_code: params['zip_code'],
        phone: params['phone']
      )
      context.client_exist = client.valid?
    end
  end
end
