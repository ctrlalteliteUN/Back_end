class GroupHasTagSerializer < ActiveModel::Serializer
  attributes :id,:created_at,:updated_at,:group_id,:tag_id
  
  belongs_to :group
  belongs_to :tag
end
