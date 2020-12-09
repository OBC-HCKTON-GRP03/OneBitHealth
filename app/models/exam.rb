# frozen_string_literal: true

class Exam < ApplicationRecord
  # Active Record Associations
  belongs_to :appointment

  # Active Record Validations
  validates :title, :description, :establishment_name, :exam_date, presence: true
end
