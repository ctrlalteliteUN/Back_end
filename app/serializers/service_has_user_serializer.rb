# == Schema Information
#
# Table name: service_has_users
#
#  id         :bigint(8)        not null, primary key
#  score      :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  service_id :bigint(8)
#  user_id    :bigint(8)
#
# Indexes
#
#  index_service_has_users_on_service_id  (service_id)
#  index_service_has_users_on_user_id     (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (service_id => services.id)
#  fk_rails_...  (user_id => users.id)
#

class ServiceHasUserSerializer < ActiveModel::Serializer
  attributes :id,:created_at,:updated_at,:service_id,:user_id
  
  belongs_to :user
  belongs_to :service
end
