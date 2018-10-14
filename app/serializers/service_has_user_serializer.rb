class ServiceHasUserSerializer < ActiveModel::Serializer
  attributes :id,:created_at,:updated_at,:service_id,:user_id
  
  belongs_to :user
  belongs_to :service
end
