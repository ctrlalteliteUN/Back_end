# == Schema Information
#
# Table name: groups
#
#  id         :bigint(8)        not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class GroupSerializer < ActiveModel::Serializer
  attributes :id,:name,:created_at,:updated_at
  
  has_many :posts


  has_many :group_has_tags
  has_many :tags, through: :group_has_tags


  has_many :posts

  has_many :user_has_groups
  has_many :users, through: :user_has_groups
end
