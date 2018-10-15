# == Schema Information
#
# Table name: users
#
#  id                     :bigint(8)        not null, primary key
#  authentication_token   :string(30)
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  name                   :string
#  password               :string
#  password_confirmation  :string
#  perimission_level      :integer
#  remember_created_at    :datetime
#  reset_password_sent_at :datetime
#  reset_password_token   :string
#  score                  :float
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
# Indexes
#
#  index_users_on_authentication_token  (authentication_token) UNIQUE
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#

class UserSerializer < ActiveModel::Serializer
  attributes :id,:authentication_token,:email,:encrypted_password,:name,:password,:password_confirmation,:perimission_level,:remember_created_at,:reset_password_sent_at,:reset_password_token,:score,:created_at,:updated_at
  has_many :posts
  has_many :comments, through: :posts

  has_many :service_has_users
  has_many :services, through: :service_has_users

  has_many :user_has_groups
  has_many :groups, through: :user_has_groups
end
