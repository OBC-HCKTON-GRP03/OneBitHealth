# frozen_string_literal: true

# == Schema Information
#
# Table name: appointments
#
#  id                :bigint           not null, primary key
#  title             :string           not null
#  description       :text             not null
#  professional_name :string           not null
#  appointment_date  :date             not null
#  user_id           :bigint           not null
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#
class Appointment < ApplicationRecord
  # Active Record Associations
  belongs_to :user
  has_many :exams, dependent: :destroy
  has_many :treatments, dependent: :destroy

  # Active Record Validations
  validates :title, :description, :professional_name, :appointment_date, presence: true
end
