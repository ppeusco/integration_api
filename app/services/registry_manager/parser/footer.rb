module RegistryManager
  module Parser
    class Footer < ApplicationService
      def initialize(footer)
        @footer = footer
      end

      def call
        @footer
      end
    end
  end
end