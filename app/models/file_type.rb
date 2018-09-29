class FileType < ApplicationRecord
  #validations
  validates :type, presence: true, uniqueness: true
  
  #associations
  has_many :file
end
