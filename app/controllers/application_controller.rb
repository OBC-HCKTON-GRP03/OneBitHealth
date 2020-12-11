# frozen_string_literal: true

class ApplicationController < ActionController::Base
  class Forbidden < ActionController::ActionControllerError; end
  before_action :configure_permitted_parameters, if: :devise_controller?

  include ErrorsHanlder

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_in, keys: %i[email password])
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[name email password password_confirmation])
  end
end
