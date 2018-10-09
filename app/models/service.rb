# == Schema Information
#
# Table name: services
#
#  id         :integer          not null, primary key
#  score      :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  post_id    :integer
#
# Indexes
#
#  index_services_on_post_id  (post_id)
#

class Service < ApplicationRecord

  validates :score, presence: true

  #associations
  belongs_to :post

  has_many :service_has_users
  has_many :users, through: :service_has_users
end
