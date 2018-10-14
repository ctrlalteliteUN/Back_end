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
  attributes :id,:tipo,:created_at,:updated_at
  
  has_many :app_file
end
