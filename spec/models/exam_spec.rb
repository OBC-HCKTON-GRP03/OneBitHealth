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
require 'rails_helper'

RSpec.describe Exam, type: :model do
  it { is_expected.to validate_presence_of(:title) }
  it { is_expected.to validate_presence_of(:description) }
  it { is_expected.to validate_presence_of(:establishment_name) }
  it { is_expected.to validate_presence_of(:exam_date) }

  it { is_expected.to belong_to(:appointment) }
end
