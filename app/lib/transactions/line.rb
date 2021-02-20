# frozen_string_literal: true

module Transactions
  # app/lib/transactions/dsl_file.rb
  class Line
    BUILDER_CLASSES = {
      1 => 'RegistryManager::Parser::Header',
      2 => 'RegistryManager::Parser::Transaction',
      3 => 'RegistryManager::Parser::Discount',
      4 => 'RegistryManager::Parser::Footer'
    }.freeze

    attr_reader :type

    def initialize(type)
      super()
      @type = type
    end

    def parse(line)
      BUILDER_CLASSES[type].constantize.call(line)
    end
  end
end
