class Tag < ApplicationRecord
  has_many :grouphastags
  has_many :groups, through: :grouphastags

  has_many :posthastags
  has_many :posts, through: :posthastags


end
