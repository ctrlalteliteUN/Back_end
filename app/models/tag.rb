# == Schema Information
#
# Table name: tags
#
#  id         :bigint(8)        not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Tag < ApplicationRecord

  validates :name, presence: true,length: {minimum: 2}


  #validations
  has_many :group_has_tags
  has_many :groups, through: :group_has_tags

  has_many :post_has_tags
  has_many :posts, through: :post_has_tags


end
