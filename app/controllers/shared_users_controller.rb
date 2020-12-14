# frozen_string_literal: true

class SharedUsersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_shared_user, only: [:destroy]
  layout 'dashboard' 

  def index
    @shared_history = current_user.users_sharing_with_me
  end

  def create
    @share_user = SharedUser.new(shared_user_params)

    respond_to do |format|
      if @share_user.save
        format.html { redirect_to dashboard_path, notice: 'Compartilhamento efetuado com sucesso!' }
      else
        format.html { render :new }
      end
    end
  end

  def destroy
    @shared_user.destroy
    redirect_to dashboard_path
  end

  def set_shared_user
    # @shared_user = SharedUser.find_by(user_id: params[:id], i_share_with_id: current_user)
    @shared_user = SharedUser.find_by(user_id: current_user, i_share_with_id: params[:id])
  end

  def shared_user_params
    params.permit(:user_id, :i_share_with_id)
  end
end
