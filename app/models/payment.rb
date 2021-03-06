class Payment < ApplicationRecord
  # model association
  belongs_to :client

  # validations
  validates_presence_of :payment_date, :currency, :total_amount, :total_discounts, :total_with_discounts, :client_id
end
