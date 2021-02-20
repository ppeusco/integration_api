# frozen_string_literal: true

module Transactions
  # app/lib/transactions/list.rb
  class List
    def initialize
      super()
      @list = []
    end

    def add_block(block)
      @list << block
    end

    def play; end
  end
end
