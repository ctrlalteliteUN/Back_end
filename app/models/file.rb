class File < ApplicationRecord
  #validations
  validates :path, presence: true, uniqueness: true
  validates :file_type_id, presence: true
  
  #associations
  belongs_to :file_type
  belongs_to :user
  belongs_to :post
end
