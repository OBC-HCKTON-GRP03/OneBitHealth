# frozen_string_literal: true

class TreatmentsController < ApplicationController
  before_action :authenticate_user!
  before_action :get_appointment
  before_action :set_treatment, only: %i[show edit update destroy]
  layout 'dashboard'
  # GET /treatments
  # GET /treatments.json
  def index
    @treatments = @appointment.treatments
  end

  # GET /treatments/1
  # GET /treatments/1.json
  def show; end

  # GET /treatments/new
  def new
    @treatment = @appointment.treatments.build
  end

  # GET /treatments/1/edit
  def edit; end

  # POST /treatments
  # POST /treatments.json
  def create
    @treatment = @appointment.treatments.build(treatment_params)

    respond_to do |format|
      if @treatment.save
        format.html do
          # Ao criar um novo tratamento você voltará para a tela de consulta
          redirect_to appointment_path(@appointment), notice: 'Tratamento adicionado com sucesso.'
        end
        format.json { render :show, status: :created, location: @treatment }
      else
        format.html { render :new }
        format.json { render json: @treatment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /treatments/1
  # PATCH/PUT /treatments/1.json
  def update
    respond_to do |format|
      if @treatment.update(treatment_params)
        format.html do
          # Ao realizar o atualização você voltará ao tela do tratamento atualizado
          redirect_to appointment_treatment_path(@appointment), notice: 'Tratamento atualizado com sucesso.'
        end
        format.json { render :show, status: :ok, location: @treatment }
      else
        format.html { render :edit }
        format.json { render json: @treatment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /treatments/1
  # DELETE /treatments/1.json
  def destroy
    @treatment.destroy
    respond_to do |format|
      format.html do
        # Ao remover o tratamento você voltará ao show da consulta
        redirect_to appointment_path(@appointment), notice: 'Tratamento removido com sucesso.'
      end
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_treatment
    @treatment = @appointment.treatments.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def treatment_params
    params.require(:treatment).permit(:title, :description, :establishment_name, :kind, :treatment_date,
                                      :appointment_id)
  end

  def get_appointment
    @appointment = Appointment.find(params[:appointment_id])
  end
end
