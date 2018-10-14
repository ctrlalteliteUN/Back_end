class CommentSerializer < ActiveModel::Serializer
  attributes :id,:body,:created_at,:updated_at,:post_id,:user_id
  
  belongs_to :user
  belongs_to :post
end
