module RegistryManager
  module Parser
    class Header < ApplicationService
      def initialize(header)
        @header = header
      end

      def call
        @header
      end
    end
  end
end