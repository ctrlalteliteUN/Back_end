class Group < ApplicationRecord

  has_many :grouphastags
  has_many :tags, through: :grouphastags
 
has_many :posthastags
  has_many :posts, through: :posthastags
 
has_many :userhasgroups
  has_many :users, through: :userhasgroups

end
