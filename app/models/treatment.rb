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
