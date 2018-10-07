# == Schema Information
#
# Table name: services
#
#  id         :integer          not null, primary key
#  score      :integer
#  post_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Service < ApplicationRecord

  validates :score, presence: true

  #associations
  belongs_to :post

  has_many :service_has_users
  has_many :users, through: :service_has_users
end
