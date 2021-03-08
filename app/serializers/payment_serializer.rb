class PaymentSerializer < ActiveModel::Serializer
  attributes :id, :payment_date, :currency, :total_amount, :total_discounts, :total_with_discounts, :client_id
end
