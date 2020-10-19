module RegistryManager
  class Creator < ApplicationService

    attr_reader :registry
    def initialize(registry)
      @registry = registry
    end

    def call

    end
  end
end
