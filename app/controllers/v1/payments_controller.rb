# frozen_string_literal: true

# app/controllers/payments_controller.rb
module V1
  class PaymentsController < ApplicationController
    before_action :set_client
    before_action :set_client_payment, only: :show

    # GET /clients/:client_id/payments
    def index
      json_response(@client.payments.paginate(page: params[:page], per_page: 20))
    end

    # GET /clients/:client_id/payments/:id
    def show
      json_response(@payment)
    end

    # GET /clients/:client_id/payments/received
    def received
      json_response(
        total_ars: @client.payments.received.in_ars.pluck(:total_with_discounts).sum(&:to_i),
        total_usd: @client.payments.received.in_usd.pluck(:total_with_discounts).sum(&:to_i)
      )
    end

    # GET /clients/:client_id/payments/pending
    def pending
      json_response(
        total_ars: @client.pending_payments.in_ars.pluck(:total_with_discounts).sum(&:to_i),
        total_usd: @client.pending_payments.in_usd.pluck(:total_with_discounts).sum(&:to_i)
      )
    end

    private

    def set_client
      @client = Client.find(params[:client_id])
    end

    def set_client_payment
      @payment = @client.payments.find_by!(id: params[:id]) if @client
    end
  end
end
