# frozen_string_literal: true

json.array! @appointments, partial: 'appointments/appointment', as: :appointment
