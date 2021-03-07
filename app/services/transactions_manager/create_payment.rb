module TransactionsManager
  class CreatePayment
    include Interactor

    def call
      return unless context.client_exist

      payment = Payment.create!(
        id: context.registry['payment']['id'],
        payment_date: context.registry['payment']['payment_date'],
        currency: context.registry['payment']['id'],
        total_amount: context.registry['payment']['total_amount'],
        total_discounts: context.registry['payment']['total_discounts'],
        total_with_discounts: context.registry['payment']['total_with_discounts'],
        client_id: context.client_id
      )

      context.payment_exist = payment.valid?
    end
  end
end
