module RegistryManager
  module Parser
    class Transaction < ApplicationService
      def initialize(transaction)
        @transaction = transaction
      end

      def call
        @transaction
      end
    end
  end
end
