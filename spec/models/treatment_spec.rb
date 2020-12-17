# frozen_string_literal: true

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
require 'rails_helper'

RSpec.describe Treatment, type: :model do
  it { is_expected.to validate_presence_of(:title) }
  it { is_expected.to validate_presence_of(:description) }
  it { is_expected.to validate_presence_of(:establishment_name) }
  it { is_expected.to validate_presence_of(:treatment_date) }

  it { is_expected.to validate_presence_of(:kind) }
  it { is_expected.to define_enum_for(:kind).with_values({ medicine: 0, physiotherapy: 1 }) }

  it { is_expected.to belong_to(:appointment) }
end
