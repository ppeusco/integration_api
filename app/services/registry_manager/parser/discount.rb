module RegistryManager
  module Parser
    class Discount < ApplicationService

      Result = Struct.new(:discount_id, :amount, :type, keyword_init: true)

      def initialize(discount)
        @discount = discount
      end

      def call
        Result.new(
          discount_id: @discount[1..32],
          amount: @discount[33..45],
          type: @discount[49..50]
        )
      end
    end
  end
end
