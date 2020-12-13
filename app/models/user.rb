# frozen_string_literal: true

# == Schema Information
#
# Table name: users
#
#  id                     :bigint           not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  name                   :string
#
class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # Active Record Validations
  validates :name, :email, :encrypted_password, presence: true

  # Active Record Associations
  has_many :appointments, dependent: :destroy
  has_many :exams, through: :appointments
  has_many :treatments, through: :appointments

  has_and_belongs_to_many :users_i_share_with,
                          class_name: 'User',
                          foreign_key: 'user_id',
                          association_foreign_key: 'i_share_with_id',
                          join_table: :shared_users

  has_and_belongs_to_many :users_sharing_with_me,
                          class_name: 'User',
                          foreign_key: 'i_share_with_id',
                          association_foreign_key: 'user_id',
                          join_table: :shared_users
end
