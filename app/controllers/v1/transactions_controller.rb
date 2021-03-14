# frozen_string_literal: true

# app/controllers/transactions_controller.rb
module V1
  class TransactionsController < ApplicationController
    before_action :set_client
    before_action :set_client_transaction, only: :show

    # GET /clients/:client_id/transactions
    def index
      json_response(set_client.transactions.paginate(page: params[:page], per_page: 20))
    end

    # GET /clients/:client_id/transactions/:id
    def show
      json_response(set_client_transaction)
    end

    private

    def set_client
      @client ||= Client.find(params[:client_id])
    end

    def set_client_transaction
      @transaction ||= set_client.transactions.find_by!(id: params[:id]) if set_client
    end
  end
end
