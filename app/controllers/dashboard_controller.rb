class DashboardController < ApplicationController
	layout "dashboard"
	def index
		@appointments = Appointment.all
		#@exams = @appointment.exams
		#@treatments = @appointment.treatments
	end
end