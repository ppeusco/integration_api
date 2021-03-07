# frozen_string_literal: true

FactoryBot.define do
  factory :client do
    id { Faker::Alphanumeric.alphanumeric(number: 32) }
    email { Faker::Internet.safe_email }
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    job { Faker::Job.title }
    country { Faker::Address.country }
    address { Faker::Address.street_address }
    zip_code { Faker::Address.zip_code }
    phone { Faker::PhoneNumber.phone_number }
  end
end
