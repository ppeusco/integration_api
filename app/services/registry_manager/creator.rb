# frozen_string_literal: true

module RegistryManager
  # app/services/registry_manager/creator.rb
  class Creator < ApplicationService
    attr_reader :registry

    def initialize(registry)
      super()
      @registry = registry
    end

    def call; end
  end
end
