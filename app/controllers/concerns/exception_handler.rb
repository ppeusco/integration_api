# frozen_string_literal: true

# app/controllers/concerns/exception_handler.rb
module ExceptionHandler
  # provides the more graceful `included` method
  extend ActiveSupport::Concern

  included do
    rescue_from ActiveRecord::RecordNotFound do |exception|
      json_response({ message: exception.message }, :not_found)
    end
  end
end
