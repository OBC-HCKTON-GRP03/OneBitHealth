# == Schema Information
#
# Table name: treatments
#
#  id                 :bigint           not null, primary key
#  title              :string           not null
#  description        :text             not null
#  establishment_name :string           not null
#  kind               :integer          not null
#  treatment_date     :date             not null
#  appointment_id     :bigint           not null
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#
class Treatment < ApplicationRecord
  # Active Record Associations
  belongs_to :appointment

  # Active Record Validations
  validates :title, :description, :establishment_name, :kind, :treatment_date, presence: true

  enum kind: {
    medicine: 0,
    physiotherapy: 1
  }
end
