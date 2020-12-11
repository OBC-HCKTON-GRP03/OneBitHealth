class DashboardController < ApplicationController
	before_action :authenticate_user! 
	layout "dashboard"
	
	def index
		@appointments = Appointment.order(updated_at: :desc).where(user_id: current_user.id).take(3)
		@exams = Exam.order(updated_at: :desc).where(appointment_id: @appointments).take(3)
		@treatments = Treatment.order(updated_at: :desc).where(appointment_id: @appointments).take(3)
	end
end