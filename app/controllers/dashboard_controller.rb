# frozen_string_literal: true

class DashboardController < ApplicationController
  before_action :authenticate_user!
  layout 'dashboard'

  def index
    if params[:search].present?
      sql = "SELECT
							a.title as title,
							a.appointment_date as date,
							a.professional_name as professional,
							'-' as establishment,
							'appointments/' || a.id as link
						FROM
							appointments a
						WHERE
							a.user_id = #{current_user.id} AND
							a.title ILIKE '%#{params[:search]}%'
						UNION
						SELECT
							e.title as title,
							e.exam_date as date,
							'-' as professional,
							e.establishment_name as establishment,
							'appointments/' || e.appointment_id || '/exams/' || e.id as link
						FROM
							exams e
						WHERE
							e.title ILIKE '%#{params[:search]}%' AND
							e.appointment_id IN (SELECT id
								FROM appointments
								WHERE user_id = #{current_user.id})
						UNION
						SELECT
							t.title as title,
							t.treatment_date as date,
							'-' as professional,
							t.establishment_name as establishment,
							'appointments/' || t.appointment_id || '/treatments/' || t.id as link
						FROM
							treatments t
						WHERE
							t.title ILIKE '%#{params[:search]}%' AND
							t.appointment_id IN (SELECT id
								FROM appointments
								WHERE user_id = #{current_user.id})"

      @results = ActiveRecord::Base.connection.execute(sql)

      respond_to do |format|
        format.js
        return
      end
    end

    @appointments = current_user.appointments.order(appointment_date: :desc).limit(3)
    @exams = current_user.exams.order(exam_date: :desc).limit(3)
    @treatments = current_user.treatments.order(treatment_date: :desc).limit(3)

    respond_to do |format|
      format.html
    end
  end

  # def users_sharing_with_me
  #   @shared_history = current_user.users_sharing_with_me
  #   render 'dashboard/users_sharing_with_me'
  # end
end
