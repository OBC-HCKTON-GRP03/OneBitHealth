# frozen_string_literal: true

# == Schema Information
#
# Table name: shared_users
#
#  id              :bigint           not null, primary key
#  user_id         :bigint
#  i_share_with_id :bigint
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
require 'rails_helper'

RSpec.describe SharedUser, type: :model do
  it { is_expected.to belong_to(:user) }
  it { is_expected.to belong_to(:i_share_with) }
end
