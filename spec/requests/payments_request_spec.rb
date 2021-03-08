# frozen_string_literal: true

# spec/requests/payments_spec.rb
require 'rails_helper'

RSpec.describe 'Payments API', type: :request do
  # initialize test data
  let!(:client) { create(:client) }
  let!(:payments) { create_list(:payment, 20, client_id: client.id) }
  let(:client_id) { client.id }
  let(:id) { payments.first.id }

  # Test suite for GET /clients/:client_id/payments
  describe 'GET /clients/:client_id/payments' do
    before { get "/clients/#{client_id}/payments" }

    context 'when client exists' do
      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end

      it 'returns all client payments' do
        expect(json.size).to eq(20)
      end
    end

    context 'when client does not exist' do
      let(:client_id) { 0 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find Client/)
      end
    end
  end

  # Test suite for GET /clients/:client_id/payments/:id
  describe 'GET /clients/:client_id/payments/:id' do
    before { get "/clients/#{client_id}/payments/#{id}" }

    context 'when client payment exists' do
      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end

      it 'returns the payment' do
        expect(json['id']).to eq(id)
      end
    end

    context 'when client payment does not exist' do
      let(:id) { 0 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match("{\"message\":\"Couldn't find Payment with [WHERE \\\"payments\\\".\\\"client_id\\\" = ? AND \\\"payments\\\".\\\"id\\\" = ?]\"}")
      end
    end
  end
  
  # Test suite for GET /clients/:client_id/payments/pending
  describe 'GET /clients/:client_id/payments' do
    before { get "/clients/#{client_id}/payments/pending" }

    context 'when client exists' do 
      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end

      it 'Returns a json with the total in pesos and the total in usd' do
        expect(json.size).to eq(2)
        expect(json['total_ars']).to eq(client.payments.pending.in_ars.pluck(:total_with_discounts).sum(&:to_i))
        expect(json['total_usd']).to eq(client.payments.pending.in_usd.pluck(:total_with_discounts).sum(&:to_i))
      end
    end
  end
  
  # Test suite for GET /clients/:client_id/payments/received
  describe 'GET /clients/:client_id/payments' do
    before { get "/clients/#{client_id}/payments/received" }

    context 'when client exists' do 
      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end

      it 'Returns a json with the total in pesos and the total in usd' do
        expect(json.size).to eq(2)
        expect(json['total_ars']).to eq(client.payments.received.in_ars.pluck(:total_with_discounts).sum(&:to_i))
        expect(json['total_usd']).to eq(client.payments.received.in_usd.pluck(:total_with_discounts).sum(&:to_i))
      end
    end
  end
end
