# frozen_string_literal: true

module RegistryManager
  module Parser
    class Transaction < ApplicationService
      Result = Struct.new(:transaction_id, :amount, :type, keyword_init: true)

      def initialize(transaction)
        @transaction = transaction
      end

      def call
        Result.new(
          transaction_id: @transaction[1..32],
          amount: @transaction[33..45],
          type: @transaction[51]
        )
      end
    end
  end
end
