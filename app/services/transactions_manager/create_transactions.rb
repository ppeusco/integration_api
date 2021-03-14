# frozen_string_literal: true

module TransactionsManager
  # This interactor create a transactions in the database.
  class CreateTransactions
    include Interactor

    def call
      return unless context.client_exist
      return unless context.payment_exist

      context.registry[:transactions].each do |transaction|
        CreateTransactionJob.perform_later(
          transaction: transaction,
          client_id: context.client_id,
          payment_id: context.payment_id
        )
      end
    end
  end
end
