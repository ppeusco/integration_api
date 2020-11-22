module TransactionsManager
  class Process < ApplicationService
    def initialize(registries:)
      @registries = registries
    end

    def call
      @registries.each do |registry|

      end
    end
  end
end
