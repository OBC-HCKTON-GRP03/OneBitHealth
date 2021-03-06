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
        format.js { render json: @share_user, status: :created }.to_json
      else
        format.html { render :new }
      end
    end
  end

  def search_user
    current_user_id = current_user.id

    searched_users = User.where('id != ? and email like ? and id not in (?)',
                                current_user_id,
                                "%#{search_shared_user_params[:email]}%",
                                SharedUser.select('i_share_with_id').where(user_id: current_user_id))

    render json: { current_user_id: current_user_id, shared_users: searched_users }.to_json
  end

  def destroy
    shared = current_user.users_i_share_with.reject { |x| x.id == params[:id] }

    respond_to do |format|
      if @shared_user.destroy
        format.html { redirect_to dashboard_path, notice: 'Exclusão efetuado com sucesso!' }
        format.js { render json: { shared: shared }, status: :ok }.to_json
      end
    end
  end

  def set_shared_user
    params.permit(:i_share_with_id)
    # @shared_user = SharedUser.find_by(user_id: params[:id], i_share_with_id: current_user)
    @shared_user = SharedUser.find_by(user_id: current_user, i_share_with_id: params[:id])
  end

  def shared_user_params
    params.permit(:user_id, :i_share_with_id)
  end

  def search_shared_user_params
    params.permit(:email)
  end
end
