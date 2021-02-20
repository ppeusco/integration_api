# frozen_string_literal: true

# app/controllers/client_controller.rb
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

  private

  def set_client
    @client = Client.find(params[:id])
  end
end
