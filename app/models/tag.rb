class Tag < ApplicationRecord

  validates :name, presence: true, uniqueness: true,length: {minimum: 5}


  #validations
  has_many :group_has_tags
  has_many :groups, through: :group_has_tags

  has_many :post_has_tags
  has_many :posts, through: :post_has_tags


end
