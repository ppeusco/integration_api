# frozen_string_literal: true

module Transactions
  # app/lib/transactions/dsl_file.rb
  class DslFile
    def initialize(args)
      super()
      @list = args[:list]
      @block = args[:block]
    end

    def parse(transactions)
      transactions.each do |line|
        nro = line[0].to_i
        case nro
        when 1..3
          @block.add_line(Line.new(nro).parse(line))
        when 4
          add_block(nro, line)
        end
      end
      @list.play
    end

    def self.run(args)
      new(list: args[:list], block: args[:block]).parse(args[:transactions])
    end
    
    def add_block(nro, line)
      @block.add_line(Line.new(nro).parse(line))
      @list.add_block(@block)
      @block = Block.new
    end
  end
end
