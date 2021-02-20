# frozen_string_literal: true

module RegistryManager
  module Parser
    # app/services/registry_manager/parser/discount.rb
    class Footer < ApplicationService
      Result = Struct.new(:reserved, :payment_date, :client_id, keyword_init: true)

      def initialize(footer)
        super()
        @footer = footer
      end

      def call
        Result.new(
          reserved: @footer[1..15],
          payment_date: @footer[16..23],
          client_id: @footer[24..55]
        )
      end
    end
  end
end
