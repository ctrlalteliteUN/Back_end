class RecordSerializer < ActiveModel::Serializer
  attributes :id,:created_at,:updated_at,:service_id,:user_id
  
  belongs_to :user
  has_many :services
end
