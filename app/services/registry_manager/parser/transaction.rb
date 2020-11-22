module RegistryManager
  module Parser
    class Transaction < ApplicationService

      Result = Struct.new(:transaction_id, :amount, :reserved, :type, keyword_init: true)

      def initialize(transaction)
        @transaction = transaction
      end

      def call
        Result.new(
          transaction_id: @transaction[1..32],
          amount: @transaction[33..45],
          reserved: @transaction[46..50],
          type: @transaction[51]
        )
      end
    end
  end
end
