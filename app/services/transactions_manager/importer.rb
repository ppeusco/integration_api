module TransactionsManager
  class Importer < ApplicationService
    def initialize(parser:, file:)
      @parser = parser
      @file = file
      @registries = []
      @stack = Stack.new
    end

    def call
      lines.each do |line|
        nro = line[0].to_i
        case nro
        when 1..3
          @stack.push(parser_factory(nro).call(line))
        when 4
          @stack.push(parser_factory(nro).call(line))
          @registries << @stack
          @stack = Stack.new
        end
      end
      @registries
    end

    private

    def lines
      @parser.call(@file)
    end

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
