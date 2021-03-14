# frozen_string_literal: true

class GetTransactionsFileJob < ApplicationJob
  queue_as :transactions

  def perform
    client = TransactionApi::V1::Client.new(ENV['BEARER_TOKEN'])
    transactions = client.transaction_file&.split("\n")
    TransactionsManager::Importer.call(lines: transactions)
  end
end
