# == Schema Information
#
# Table name: file_types
#
#  id         :bigint(8)        not null, primary key
#  tipo       :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class FileType < ApplicationRecord
  #validations
  validates :tipo, presence: true, uniqueness: true
  
  #associations
  has_many :app_file
end
