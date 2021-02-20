# frozen_string_literal: true

# app/controllers/transactions_controller.rb
class TransactionsController < ApplicationController
  before_action :set_client
  before_action :set_client_transaction, only: :show

  # GET /clients/:client_id/transactions
  def index
    json_response(@client.transactions)
  end

  # GET /clients/:client_id/transactions/:id
  def show
    json_response(@transaction)
  end

  private

  def set_client
    @client = Client.find(params[:client_id])
  end

  def set_client_transaction
    @transaction = @client.transactions.find_by!(id: params[:id]) if @client
  end
end
