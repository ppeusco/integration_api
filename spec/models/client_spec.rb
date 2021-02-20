# frozen_string_literal: true

require 'rails_helper'
RSpec.describe Client, type: :model do
  # Association test
  # ensure Client model has a 1:m relationship with the Transaction model
  it { should have_many(:transactions).dependent(:destroy) }
  # Validation tests
  # ensure columns email,first_name, last_name, job, country,
  # address, zip_code, and phone are present before saving
  it { should validate_presence_of(:email) }
  it { should validate_presence_of(:first_name) }
  it { should validate_presence_of(:last_name) }
  it { should validate_presence_of(:job) }
  it { should validate_presence_of(:country) }
  it { should validate_presence_of(:address) }
  it { should validate_presence_of(:zip_code) }
  it { should validate_presence_of(:phone) }
end
