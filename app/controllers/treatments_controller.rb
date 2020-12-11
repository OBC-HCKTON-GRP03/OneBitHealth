class TreatmentsController < ApplicationController
  before_action :authenticate_user!
  before_action :get_appointment
  before_action :set_treatment, only: %i[show edit update destroy]
  layout "dashboard"
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
        format.html { redirect_to appointment_treatments_path(@appointment), notice: 'Treatment was successfully created.' }
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
        format.html { redirect_to appointment_treatments_path(@appointment), notice: 'Treatment was successfully updated.' }
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
      format.html { redirect_to appointment_treatments_path(@appointment), notice: 'Treatment was successfully destroyed.' }
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
    params.require(:treatment).permit(:title, :description, :establishment_name, :kind, :treatment_date, :appointment_id)
  end

  def get_appointment
    @appointment = Appointment.find(params[:appointment_id])
  end
end
