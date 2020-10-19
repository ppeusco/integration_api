module RegistryManager
  module Parser
    class Discount < ApplicationService
      def initialize(discount)
        @discount = discount
      end

      def call
        @discount
      end
    end
  end
end