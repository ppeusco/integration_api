# spec/requests/transactions_spec.rb
require 'rails_helper'

RSpec.describe 'Transactions API', type: :request do
  # initialize test data
  let!(:client) { create(:client) }
  let!(:transactions) { create_list(:transaction, 20, client_id: client.id) }
  let(:client_id) { client.id }
  let(:id) { transactions.first.id }

  # Test suite for GET /clients/:client_id/transactions
  describe 'GET /clients/:client_id/transactions' do
    before { get "/clients/#{client_id}/transactions" }

    context 'when client exists' do
      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end

      it 'returns all client transactions' do
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
  
  # Test suite for GET /clients/:client_id/transactions/:id
  describe 'GET /clients/:client_id/transactions/:id' do
    before { get "/clients/#{client_id}/transactions/#{id}" }

    context 'when client transaction exists' do
      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end

      it 'returns the transaction' do
        expect(json['id']).to eq(id)
      end
    end

    context 'when client transaction does not exist' do
      let(:id) { 0 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match("{\"message\":\"Couldn't find Transaction with [WHERE \\\"transactions\\\".\\\"client_id\\\" = ? AND \\\"transactions\\\".\\\"id\\\" = ?]\"}")
      end
    end
  end
end
