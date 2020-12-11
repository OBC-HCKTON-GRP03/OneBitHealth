# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Appointment, type: :model do
  it { is_expected.to validate_presence_of(:title) }
  it { is_expected.to validate_presence_of(:description) }
  it { is_expected.to validate_presence_of(:professional_name) }
  it { is_expected.to validate_presence_of(:appointment_date) }

  it { is_expected.to belong_to(:user) }

  it { is_expected.to have_many(:exams).dependent(:destroy) }
  it { is_expected.to have_many(:treatments).dependent(:destroy) }
end
