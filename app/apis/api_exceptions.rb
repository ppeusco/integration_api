# frozen_string_literal: true

module ApiExceptions
  ApiExceptionError = Class.new(StandardError)
  BadRequestError = Class.new(ApiExceptionError)
  UnauthorizedError = Class.new(ApiExceptionError)
  ForbiddenError = Class.new(ApiExceptionError)
  ApiRequestsQuotaReachedError = Class.new(ApiExceptionError)
  NotFoundError = Class.new(ApiExceptionError)
  UnprocessableEntityError = Class.new(ApiExceptionError)
  ApiError = Class.new(ApiExceptionError)
end
