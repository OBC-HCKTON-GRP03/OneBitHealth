class DashboardController < ApplicationController
	layout "dashboard"

	def index
		@appointments = current_user.appointments.order(appointment_date: :desc).limit(3)
		@exams = current_user.exams.order(exam_date: :desc).limit(3)
		@treatments = current_user.treatments.order(treatment_date: :desc).limit(3)
	end
end
