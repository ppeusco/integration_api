# frozen_string_literal: true

module RegistryManager
  class HashCreator < ApplicationService
    def initialize(args = {})
      @registry = args[:registry]
      @registry_hash = HashWithIndifferentAccess.new
      @header = @registry.shift
      @footer = @registry.pop
    end

    def call
      @registry_hash[:client_id] = @footer.client_id
      @registry_hash[:payment] = payment_hash
      @registry_hash[:transactions] = transactions_hash
      @registry_hash
    end

    private

    def payment_hash
      result = HashWithIndifferentAccess.new
      result[:id] = @header.payment_id
      result[:payment_date] = @footer.payment_date
      result[:currency] = @header.currency
      result[:total_amount] = @header.total_amount
      result[:total_discounts] = @header.total_discounts
      result[:total_with_discounts] = @header.total_with_discounts
      result
    end

    def transactions_hash
      result = []

      until @registry.empty?
        item = @registry.shift
        transaction_hash = HashWithIndifferentAccess.new
        transaction_hash[:id] = item.transaction_id
        transaction_hash[:amount] = item.amount
        transaction_hash[:type] = item.type
        result << transaction_hash
      end

      result
    end
  end
end
