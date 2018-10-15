class RecordSerializer < ActiveModel::Serializer
  attributes :id,:created_at,:updated_at,:service_id,:user_id,:servicio
  #belongs_to :service
  belongs_to :user
  def servicio
    svr = Service.find(object.service_id) 
    ServiceSerializer.new(svr)
  end
end
