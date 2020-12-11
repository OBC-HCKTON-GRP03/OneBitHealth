# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Treatment, type: :model do
  it { is_expected.to validate_presence_of(:title) }
  it { is_expected.to validate_presence_of(:description) }
  it { is_expected.to validate_presence_of(:establishment_name) }
  it { is_expected.to validate_presence_of(:treatment_date) }

  it { is_expected.to validate_presence_of(:kind) }
  it { is_expected.to define_enum_for(:kind).with_values({ medicine: 0, physiotherapy: 1 }) }
end
