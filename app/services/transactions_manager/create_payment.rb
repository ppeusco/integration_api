# frozen_string_literal: true

module TransactionsManager
  # This interactor create a payment in the database.
  class CreatePayment
    include Interactor

    def call
      return unless context.client_exist
      registry = context.registry['payment']
      payment_id = registry['id']

      return if Payment.where(id: payment_id).any?

      payment = Payment.create!(
        id: payment_id,
        payment_date: registry['payment_date'],
        currency: registry['currency'],
        total_amount: registry['total_amount'],
        total_discounts: registry['total_discounts'],
        total_with_discounts: registry['total_with_discounts'],
        client_id: context.client_id
      )
      context.payment_id = payment_id
      context.payment_exist = payment.valid?
    end
  end
end
