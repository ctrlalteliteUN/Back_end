class Service < ApplicationRecord

  validates :score, presence: true

  #associations
  belongs_to :post

  has_many :servicehasusers
  has_many :users, through: :servicehasusers
end
