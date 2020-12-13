# frozen_string_literal: true

json.extract! exam, :id, :title, :description, :establishment_name, :exam_date, :appointment_id, :created_at,
              :updated_at
json.url exam_url(exam, format: :json)
