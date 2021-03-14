# frozen_string_literal: true

# Makes the call to Service Objects a little sweeter.
class ApplicationService
  def self.call(*args, &block)
    new(*args, &block).call
  end
end
