# frozen_string_literal: true

class AppointmentsController < ApplicationController
  before_action :authenticate_user!
  before_action :verify_shared_users

  before_action :set_appointment, only: %i[show edit update destroy]
  layout 'dashboard'
  # GET /appointments
  def index
    @appointments = get_user.appointments
  end

  # GET /appointments/1
  # GET /appointments/1.json
  def show; end

  # GET /appointments/new
  def new
    @appointment = get_user.appointments.build
  end

  # GET /appointments/1/edit
  def edit; end

  # POST /appointments
  # POST /appointments.json
  def create
    @appointment = get_user.appointments.build(appointment_params)

    respond_to do |format|
      if @appointment.save
        format.html { redirect_to @appointment, notice: 'A consulta foi criado com sucesso.' }
        format.json { render :show, status: :created, location: @appointment }
      else
        format.html { render :new }
        format.json { render json: @appointment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /appointments/1
  # PATCH/PUT /appointments/1.json
  def update
    respond_to do |format|
      if @appointment.update(appointment_params)
        format.html { redirect_to @appointment, notice: 'A consulta foi atualizado com sucesso.' }
        format.json { render :show, status: :ok, location: @appointment }
      else
        format.html { render :edit }
        format.json { render json: @appointment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /appointments/1
  # DELETE /appointments/1.json
  def destroy
    @appointment.destroy
    respond_to do |format|
      format.html { redirect_to appointments_url, notice: 'A consulta foi deletada com sucesso.' }
      format.json { head :no_content }
    end
  end

  private

  # Check relation between current_user and other user

  def get_user
    if user_check_present?
      if shared?
        @shared_user = shared?.presence
      else
        redirect_to appointments_path, notice: 'Usuário não compartilhado!'
      end
    else
      current_user
    end
  end

  def user_check_present?
    params[:user_check].present?
  end

  def sharing_with_me?
    current_user.users_sharing_with_me.find_by(id: params[:user_check])
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_appointment
    @appointment = Appointment.find_by(id: params[:id])
  end

  # Only allow a list of trusted parameters through.
  def appointment_params
    params.require(:appointment).permit(:title, :description, :professional_name, :appointment_date, :user_id)
  end
end
