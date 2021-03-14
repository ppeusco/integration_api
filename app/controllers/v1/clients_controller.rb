# frozen_string_literal: true

module V1
  class ClientsController < ApplicationController
    before_action :set_client, only: :show

    # GET /clients
    def index
      # get paginated clients
      @clients = Client.all.paginate(page: params[:page], per_page: 20)
      json_response(@clients)
    end

    # GET /clients/:id
    def show
      json_response(set_client)
    end

    def pending_payments; end

    def received_payments; end

    private

    def set_client
      @client ||= Client.find(params[:id])
    end
  end
end
