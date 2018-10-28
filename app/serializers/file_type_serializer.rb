# == Schema Information
#
# Table name: file_types
#
#  id         :bigint(8)        not null, primary key
#  tipo       :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class FileTypeSerializer < ActiveModel::Serializer
  attributes :id,:tipo,:created_at,:updated_at,:archivos
  
  #has_many :app_file
  def archivos
    svr = AppFile.where(file_type_id:object.id).select(:id,:description,:titulo,:created_at,:updated_at,:file_type_id,:post_id,:user_id)
    #AppFileSerializer.new(svr)
  end
end
