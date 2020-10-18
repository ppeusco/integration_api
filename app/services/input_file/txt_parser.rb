module InputFile
  class TxtParser < ApplicationService
    def initialize(txt_file)
      @txt_file = txt_file
    end

    def call
      f = File.open(@txt_file, 'r')
      f.each_line { |line|
        puts line
      }
      f.close
    end
  end
end
