class PasswordsController < ApplicationController
  # skip_before_action :authenticate_user_from_token!, only: [:create]

  def create
    user = User.find_by(email: create_params[:email])
    user&.send_reset_password_instructions
    render json: {}
  end
  
  def update
    user = User.reset_password_by_token(update_params)
    render json: user, status: :ok, serializer: V1::UserSerializer
  end


  private

  def create_params
    params.require(:user).permit(:email)
  end

  def update_params
    params.require(:user).permit(:password, :password_confirmation, :reset_password_token)
  end
end