class Service < ApplicationRecord

  validates :score, presence: true

  #associations
  belongs_to :post

  has_many :service_has_users
  has_many :users, through: :service_has_users
end
