class PostHasTagSerializer < ActiveModel::Serializer
  attributes :id,:created_at,:updated_at,:post_id,:tag_id
  
  belongs_to :post
  belongs_to :tag
end
