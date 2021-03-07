# frozen_string_literal: true

module TransactionsManager
  class Importer < ApplicationService
    def initialize(args = {})
      @lines = args[:lines]
      @registry = Registry.new
    end

    def call
      @lines.each do |line|
        nro = line[0].to_i
        case nro
        when 1..2
          @registry.push(parser_factory(nro).call(line))
        when 4
          @registry.push(parser_factory(nro).call(line))
          ProcessRegistryJob.perform_later(registry: @registry.to_hash)
          @registry = Registry.new
        end
      end
    end

    private

    def parser_factory(type)
      builder_classes[type].constantize
    end

    def builder_classes
      {
        1 => 'RegistryManager::Parser::Header',
        2 => 'RegistryManager::Parser::Transaction',
        3 => 'RegistryManager::Parser::Discount',
        4 => 'RegistryManager::Parser::Footer'
      }
    end
  end
end
