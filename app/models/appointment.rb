# frozen_string_literal: true

class Appointment < ApplicationRecord
  # Active Record Associations
  belongs_to :user

  # Active Record Validations
  validates :title, :description, :professional_name, :appointment_date, presence: true
end
