# frozen_string_literal: true

class ExamsController < ApplicationController
  before_action :authenticate_user!
  before_action :get_appointment
  before_action :set_exam, only: %i[show edit update destroy]
  layout 'dashboard'

  # GET /appintment/:appoint_id/exams
  def index
    @exams = @appointment.exams
  end

  # GET /exams/1
  # GET /exams/1.json
  def show; end

  # GET /exams/new
  def new
    @exam = @appointment.exams.build
  end

  # GET /exams/1/edit
  def edit; end

  # POST /exams
  # POST /exams.json
  def create
    @exam = @appointment.exams.build(exam_params)

    respond_to do |format|
      if @exam.save
        # Ao criar um exame você irá para a tela da consulta
        format.html { redirect_to appointment_path(@appointment), notice: 'Exame criado com sucesso.' }
        format.json { render :show, status: :created, location: @exam }
      else
        format.html { render :new }
        format.json { render json: @exam.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /exams/1
  # PATCH/PUT /exams/1.json
  def update
    respond_to do |format|
      if @exam.update(exam_params)
        # Ao fazer a atualização você voltará para tela de update
        format.html { redirect_to appointment_path(@appointment), notice: 'Exame foi atualizado com sucesso!' }
        format.json { render :show, status: :ok, location: @exam }
      else
        format.html { render :edit }
        format.json { render json: @exam.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /exams/1
  # DELETE /exams/1.json
  def destroy
    @exam.destroy
    respond_to do |format|
      format.html { redirect_to appointment_exams_path(@appointment), notice: 'Exame foi deletado com sucesso!' }
      format.json { head :no_content }
    end
  end

  def delete_exam_attached
    @exam = ActiveStorage::Blob.find_signed(params[:id])
    exam = ActiveStorage::Attachment.find_by(record_type: 'Exam', blob_id: @exam.id)
    exam_id = exam.record_id
    exam.purge
    @exam = Exam.find(exam_id)
    redirect_to appointment_exam_path(@exam.appointment, @exam)
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_exam
    @exam = @appointment.exams.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def exam_params
    params.require(:exam).permit(:title, :description, :establishment_name, :exam_date, :appointment_id,
                                 documents: [])
  end

  def get_appointment
    @appointment = Appointment.find(params[:appointment_id])
  end
end
