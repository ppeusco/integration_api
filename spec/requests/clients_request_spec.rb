# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Clients API', type: :request do
  # initialize test data
  let!(:clients) { create_list(:client, 10) }
  let(:client_id) { clients.first.id }

  # Test suite for GET /clients
  describe 'GET /clients' do
    # make HTTP get request before each example
    before { get '/clients' }

    it 'returns clients' do
      # Note `json` is a custom helper to parse JSON responses
      expect(json).not_to be_empty
      expect(json.size).to eq(10)
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end

  # Test suite for GET /clients/:id
  describe 'GET /clients/:id' do
    before { get "/clients/#{client_id}" }

    context 'when the record exists' do
      it 'returns the client' do
        expect(json).not_to be_empty
        expect(json['id']).to eq(client_id)
      end

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end

    context 'when the record does not exist' do
      let(:client_id) { 100 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match("{\"message\":\"Couldn't find Client with 'id'=100\"}")
      end
    end
  end
end
