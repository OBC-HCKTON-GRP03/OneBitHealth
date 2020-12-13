# frozen_string_literal: true

class CreateSharedUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :shared_users do |t|
      t.references :user, index: true
      t.references :i_share_with, index: true

      t.timestamps
    end
    add_index :shared_users, %i[user_id i_share_with_id], unique: true
  end
end
