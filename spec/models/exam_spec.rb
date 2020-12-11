# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Exam, type: :model do
  it { is_expected.to validate_presence_of(:title) }
  it { is_expected.to validate_presence_of(:description) }
  it { is_expected.to validate_presence_of(:establishment_name) }
  it { is_expected.to validate_presence_of(:exam_date) }

  it { is_expected.to belong_to(:appointment) }
end
