# frozen_string_literal: true

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

  describe '.pending' do
    it 'includes payments that will be made in the future' do
      @client = Client.create!(
        id: 1,
        email: 'alvaro@shanahankreiger.info',
        first_name: 'Randolph',
        last_name: 'Schmeler',
        job: 'Lead Hospitality Liaison',
        country: 'British Indian Ocean Territory (Chagos Archipelago)',
        address: '177 Merlyn View',
        zip_code: '25776-4836',
        phone: '(925) 778-8735'
      )
      @payment = Payment.create!(
        id: 1,
        client_id: @client.id,
        payment_date: '20210323',
        currency: '000',
        total_amount: '0000205131962',
        total_discounts: '0000001035360',
        total_with_discounts: '0000204096602'
      )
      expect(Payment.pending).to include(@payment)
    end
  end

  describe '.received' do
    it 'includes payments that have already been made' do
      expect(Payment.received).not_to include(@payment)
    end
  end
end
