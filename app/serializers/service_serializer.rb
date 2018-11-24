# == Schema Information
#
# Table name: services
#
#  id         :bigint(8)        not null, primary key
#  state      :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  post_id    :bigint(8)
#
# Indexes
#
#  index_services_on_post_id  (post_id)
#
# Foreign Keys
#
#  fk_rails_...  (post_id => posts.id)
#

class ServiceSerializer < ActiveModel::Serializer
  attributes :id,:score,:state,:created_at,:updated_at,:post_id
  
  belongs_to :post

  has_many :service_has_users
  has_many :users, through: :service_has_users
end
