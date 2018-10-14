class TagSerializer < ActiveModel::Serializer
  attributes :id,:name,:created_at,:updated_at
  
  has_many :group_has_tags
  has_many :groups, through: :group_has_tags

  has_many :post_has_tags
  has_many :posts, through: :post_has_tags
end
