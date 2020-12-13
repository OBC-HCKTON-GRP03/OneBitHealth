# frozen_string_literal: true

json.extract! appointment, :id, :title, :description, :professional_name, :appointment_date, :user_id, :created_at,
              :updated_at
json.url appointment_url(appointment, format: :json)
