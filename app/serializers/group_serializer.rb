class GroupSerializer < ActiveModel::Serializer
  attributes :id,:name,:created_at,:updated_at
  
  has_many :posts


  has_many :group_has_tags
  has_many :tags, through: :group_has_tags

  has_many :post_has_tags
  has_many :posts, through: :post_has_tags

  has_many :user_has_groups
  has_many :users, through: :user_has_groups
end
