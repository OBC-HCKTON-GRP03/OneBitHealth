# frozen_string_literal: true

# == Schema Information
#
# Table name: exams
#
#  id                 :bigint           not null, primary key
#  title              :string           not null
#  description        :text             not null
#  establishment_name :string           not null
#  exam_date          :date             not null
#  appointment_id     :bigint           not null
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  documents          :json
#
class Exam < ApplicationRecord
  # CarrierWave Uploader
  mount_uploaders :documents, DocumentUploader
  # Active Record Associations
  belongs_to :appointment
  has_one :user, through: :appointment

  # Active Record Validations
  validates :title, :description, :establishment_name, :exam_date, presence: true
end
