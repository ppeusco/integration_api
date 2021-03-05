FactoryBot.define do 
  factory :payment do 
    id { Faker::Alphanumeric.alphanumeric(number: 32) } 
    payment_date { Faker::Date.between(from: 2.days.ago, to: 20.days.from_now) } 
    total_amount { Faker::Number.number(digits: 13)} 
    total_discounts { Faker::Number.number(digits: 13)} 
    total_with_discounts { Faker::Number.number(digits: 13)} 
    currency { ['000', '001'].sample } 
    client_id factory: :client 
  end
end
