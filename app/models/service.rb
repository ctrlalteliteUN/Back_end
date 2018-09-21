class Service < ApplicationRecord
  belongs_to :post

  has_many :servicehasusers
  has_many :users, through: :servicehasusers
end
