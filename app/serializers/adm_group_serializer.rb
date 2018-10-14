class AdmGroupSerializer < ActiveModel::Serializer
  attributes :id,:created_at,:updated_at,:group_id,:user_id
  
  belongs_to :user
  belongs_to :group
end
