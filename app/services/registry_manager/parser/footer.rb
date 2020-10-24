module RegistryManager
  module Parser
    class Footer < ApplicationService

      Result = Struct.new(:reserved, :payment_date, :client_id, keyword_init: true)

      def initialize(footer)
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
