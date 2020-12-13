# frozen_string_literal: true

class Exam < ApplicationRecord
  #CarrierWave Uploader
  mount_uploaders :documents, DocumentUploader
  # Active Record Associations
  belongs_to :appointment
  has_one :user, through: :appointment

  # Active Record Validations
  validates :title, :description, :establishment_name, :exam_date, presence: true
end
