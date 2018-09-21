class Tag < ApplicationRecord

  validates :name, presence: true,length: {minimum: 5}


  #validations
  has_many :grouphastags
  has_many :groups, through: :grouphastags

  has_many :posthastags
  has_many :posts, through: :posthastags


end
