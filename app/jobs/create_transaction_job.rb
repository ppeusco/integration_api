# frozen_string_literal: true

class CreateTransactionJob < ApplicationJob
  def perform(args = {})
    transaction = args[:transaction]

    Transaction.create!(
      id: transaction['id'],
      amount: transaction['amount'],
      transaction_type: transaction['type'].to_i,
      payment_id: args[:payment_id],
      client_id: args[:client_id]
    )
  end
end
