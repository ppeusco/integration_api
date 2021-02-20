# frozen_string_literal: true

module Transactions
  # app/lib/transactions/block.rb
  class Block < Stack
    attr_reader :block

    def initialize
      super()
      @block = []
    end

    def add_line(line)
      block.push(line)
    end
  end
end
