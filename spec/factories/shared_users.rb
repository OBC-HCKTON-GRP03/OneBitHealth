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
FactoryBot.define do
  factory :shared_user do
    user { nil }
    i_share_with { nil }
  end
end
