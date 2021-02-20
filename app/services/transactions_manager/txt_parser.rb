# frozen_string_literal: true

module TransactionsManager
  # app/services/transactions_manager/txt_parser.rb
  class TxtParser < ApplicationService
    def initialize(txt_file)
      super()
      @txt_file = txt_file
      @lines = []
    end

    def call
      file = File.open(@txt_file, 'r')
      file.each_line { |line| @lines << line.chomp! }
      file.close
      @lines.compact
    end
  end
end
