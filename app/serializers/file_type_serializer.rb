class FileTypeSerializer < ActiveModel::Serializer
  attributes :id,:tipo,:created_at,:updated_at
  
  has_many :app_file
end
