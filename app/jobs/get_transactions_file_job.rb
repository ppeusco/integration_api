# frozen_string_literal: true

# app/jobs/get_transactions_file_job.rb
class GetTransactionsFileJob < ApplicationJob
  queue_as :transactions

  def perform
    oauth_token = '1234567890qwertyuiopasdfghjklzxcvbnm'
    client = TransactionApi::V1::Client.new(oauth_token)
    transactions = client&.transaction_file&.split("\n")
    Transactions::DslFile.run({
                                list: Transactions::List.new,
                                block: Transactions::Block.new,
                                transactions: transactions
                              })
  end
end
