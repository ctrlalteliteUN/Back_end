class UserSerializer < ActiveModel::Serializer
  attributes :id,:authentication_token,:email,:encrypted_password,:name,:password,:password_confirmation,:perimission_level,:remember_created_at,:reset_password_sent_at,:reset_password_token,:score,:created_at,:updated_at

  has_many :posts
  has_many :comments, through: :posts

  has_many :service_has_users
  has_many :services, through: :service_has_users

  has_many :user_has_groups
  has_many :groups, through: :user_has_groups
end
