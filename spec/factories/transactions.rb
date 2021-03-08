# frozen_string_literal: true

FactoryBot.define do
  factory :transaction do
    id { Faker::Alphanumeric.alphanumeric(number: 32) }
    amount { Faker::Number.number(digits: 10) }
    transaction_type { Faker::Number.between(from: 1, to: 2) }
    client_id factory: :client
    payment_id factory: :payment
  end
end
