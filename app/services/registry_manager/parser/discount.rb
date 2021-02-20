# frozen_string_literal: true

module RegistryManager
  module Parser
    # app/services/registry_manager/parser/discount.rb
    class Discount < ApplicationService
      Result = Struct.new(:discount_id, :amount, :reserved, :type, keyword_init: true)

      def initialize(discount)
        super()
        @discount = discount
      end

      def call
        Result.new(
          discount_id: @discount[1..32],
          amount: @discount[33..45],
          reserved: @discount[46..48],
          type: @discount[49..50]
        )
      end
    end
  end
end
