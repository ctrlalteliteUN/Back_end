class FileType < ApplicationRecord
  #validations
  validates :tipo, presence: true, uniqueness: true
  
  #associations
  has_many :app_file
end
