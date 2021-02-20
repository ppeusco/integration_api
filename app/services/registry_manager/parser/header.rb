# frozen_string_literal: true

module RegistryManager
  module Parser
    # app/services/registry_manager/parser/discount.rb
    class Header < ApplicationService
      Result = Struct.new(:payment_id, :reserved, :currency, :total_amount, :total_discounts, :total_with_discounts,
                          keyword_init: true)

      def initialize(header)
        super()
        @header = header
      end

      def call
        Result.new(
          payment_id: @header[1..32],
          reserved: @header[33..35],
          currency: @header[36..38],
          total_amount: @header[39..51],
          total_discounts: @header[52..64],
          total_with_discounts: @header[65..77]
        )
      end
    end
  end
end
