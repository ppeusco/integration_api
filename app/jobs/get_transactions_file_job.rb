class GetTransactionsFileJob < ApplicationJob
  queue_as :transactions
  
  def perform
    oauth_token = '1234567890qwertyuiopasdfghjklzxcvbnm' 
    client = TransactionApi::V1::Client.new(oauth_token)
    transactions = client&.transaction_file&.split("\n")
  end
end
