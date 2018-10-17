# == Schema Information
#
# Table name: records
#
#  id         :bigint(8)        not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  service_id :bigint(8)
#  user_id    :bigint(8)
#
# Indexes
#
#  index_records_on_service_id  (service_id)
#  index_records_on_user_id     (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (service_id => services.id)
#  fk_rails_...  (user_id => users.id)
#

class RecordSerializer < ActiveModel::Serializer
  attributes :id,:created_at,:updated_at,:service_id,:user_id,:servicio
  #belongs_to :service
  belongs_to :user
  def servicio
    svr = Service.find(object.service_id) 
    ServiceSerializer.new(svr)
  end
end
