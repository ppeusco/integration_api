# frozen_string_literal: true

# seed 50 records
50.times do
  client = Client.create(
    id: Faker::Alphanumeric.alphanumeric(number: 32),
    email: Faker::Internet.safe_email,
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    job: Faker::Job.title,
    country: Faker::Address.country,
    address: Faker::Address.street_address,
    zip_code: Faker::Address.zip_code,
    phone: Faker::PhoneNumber.phone_number
  )

  client.payments.create(
    id: Faker::Alphanumeric.alphanumeric(number: 32),
    payment_date: Faker::Date.between(from: 2.days.ago, to: 20.days.from_now),
    total_amount: Faker::Number.number(digits: 13),
    total_discounts: Faker::Number.number(digits: 13),
    total_with_discounts: Faker::Number.number(digits: 13),
    currency: %w[000 001].sample
   )

   client.transactions.create(
    id: Faker::Alphanumeric.alphanumeric(number: 32),
    amount: Faker::Number.number(digits: 10),
    transaction_type: Faker::Number.between(from: 1, to: 2)
   )
end
