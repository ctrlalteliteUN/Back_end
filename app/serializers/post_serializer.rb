class PostSerializer < ActiveModel::Serializer
  attributes :id,:body,:solicitud,:title,:created_at,:updated_at,:user_id
  
  belongs_to :user
  belongs_to :group, required: false
  has_many :comments
  has_many :post_has_tags
  has_many :tags, through: :post_has_tags
end
