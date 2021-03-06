# app/controllers/payments_controller.rb
class PaymentsController < ApplicationController
  before_action :set_client
  before_action :set_client_payment, only: :show

  # GET /clients/:client_id/payments
  def index
    json_response(@client.payments)
  end

  # GET /clients/:client_id/payments/:id
  def show
    json_response(@payment)
  end

  private

  def set_client
    @client = Client.find(params[:client_id])
  end

  def set_client_payment
    @payment = @client.payments.find_by!(id: params[:id]) if @client
  end
end