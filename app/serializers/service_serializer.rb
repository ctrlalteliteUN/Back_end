class ServiceSerializer < ActiveModel::Serializer
  attributes :id,:score,:created_at,:updated_at,:post_id
  
  belongs_to :post

  has_many :service_has_users
  has_many :users, through: :service_has_users
end
