require 'rails_helper'

RSpec.describe Payment, type: :model do
  # Association test
  # ensure an transaction record belongs to a single client record
  it { should belong_to(:client) }
  # Validation tests
  # ensure columns payment_date, currency, total_amount, total_discounts, total_with_discounts, client_id and type are present before saving
  it { should validate_presence_of(:payment_date) }
  it { should validate_presence_of(:currency) }
  it { should validate_presence_of(:total_amount) }
  it { should validate_presence_of(:total_discounts) }
  it { should validate_presence_of(:total_with_discounts) }
  it { should validate_presence_of(:client_id) }
end
