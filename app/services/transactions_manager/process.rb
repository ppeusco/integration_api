# frozen_string_literal: true

module TransactionsManager
  # app/services/transactions_manager/process.rb
  class Process < ApplicationService
    def initialize(registries:)
      super()
      @registries = registries
    end

    def call
      @registries.each do |registry|
      end
    end
  end
end
