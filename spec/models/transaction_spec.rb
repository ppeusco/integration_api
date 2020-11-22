require 'rails_helper'

RSpec.describe Transaction, type: :model do
  # Association test
  # ensure an transaction record belongs to a single client record
  it { should belong_to(:client) }
  # Validation tests
  # ensure columns amount, client_id and type are present before saving
  it { should validate_presence_of(:amount) }
  it { should validate_presence_of(:client_id) }
  it { should validate_presence_of(:type) }
end
