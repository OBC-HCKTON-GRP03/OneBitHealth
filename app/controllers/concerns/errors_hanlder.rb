# frozen_string_literal: true

module ErrorsHanlder
  extend ActiveSupport::Concern

  included do
    if Rails.env.production? || Rails.env.staging? || Rails.env.test?
      rescue_from StandardError, with: :rescue_500
      rescue_from ApplicationController::Forbidden, with: :rescue_403
      rescue_from ActionController::RoutingError, with: :rescue_404
      rescue_from ActiveRecord::RecordNotFound, with: :rescue_404
    end
  end

  private

  def rescue_403(exception = nil)
    if exception
      logger.warn "403 Forbidden exception: #{exception.message}"
    else
      logger.warn '403 Forbidden'
    end
    @status_code = 403
    render 'errors/error', status: :forbidden
  end

  def rescue_404(exception = nil)
    if exception
      logger.warn "404 Not Found exception: #{exception.message}"
    else
      logger.warn '404 Not Found'
    end
    if request.xhr?
      render json: {}, status: :not_found
    else
      @status_code = 404
      render 'errors/error', status: :not_found
    end
  end

  def rescue_500(exception = nil)
    if exception
      logger.error "500 Internal Server Error exception: #{exception.message}"
    else
      logger.error '500 Internal Server Error'
    end
    if request.xhr?
      @status_code = 500
      render json: {}, status: :internal_server_error
    else
      @status_code = 500
      render 'errors/error', status: :internal_server_error
    end
  end
end
