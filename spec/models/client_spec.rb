require 'rails_helper'
RSpec.describe Client, type: :model do 
  
  it { should validate_presence_of(:email) } 
  it { should validate_presence_of(:first_name) } 
  it { should validate_presence_of(:last_name) } 
  it { should validate_presence_of(:job) } 
  it { should validate_presence_of(:country) } 
  it { should validate_presence_of(:address) } 
  it { should validate_presence_of(:zip_code) } 
  it { should validate_presence_of(:phone) }
end
