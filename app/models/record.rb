class Record < ApplicationRecord
  belongs_to :user
  has_many :services
  
end
