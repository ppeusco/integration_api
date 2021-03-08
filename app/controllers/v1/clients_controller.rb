# frozen_string_literal: true

module V1
  class ClientsController < ApplicationController
    before_action :set_client, only: :show

    # GET /clients
    def index
      @clients = Client.all
      json_response(@clients)
    end

    # GET /clients/:id
    def show
      json_response(@client)
    end

    def pending_payments; end

    def received_payments; end

    private

    def set_client
      @client = Client.find(params[:id])
    end
  end
end
