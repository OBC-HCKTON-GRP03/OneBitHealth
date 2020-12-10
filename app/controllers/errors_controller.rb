class ErrorsController < ApplicationController
  protect_from_forgery except: [:not_found]
  skip_before_action :require_login, only: [:fatal_test, :error_test]

  def not_found
    rescue_404(ActionController::RoutingError.new("No route matches #{request.request_method} #{request.path}"))
  end

  def fatal_test
    logger.fatal('fatal_test')
    render json: { test: 'ok' }
  end

  def error_test
    logger.error('error_test')
    render json: { test: 'ok' }
  end
end