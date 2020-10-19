module TransactionsManager
  class TxtParser < ApplicationService
    def initialize(txt_file)
      @txt_file = txt_file
      @lines = []
    end

    def call
      f = File.open(@txt_file, 'r')
      f.each_line { |line| @lines << line.chomp! }
      f.close
      @lines.compact
    end
  end
end
