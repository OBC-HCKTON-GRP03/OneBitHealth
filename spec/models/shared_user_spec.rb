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
  pending "add some examples to (or delete) #{__FILE__}"
end
