class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :comments
  has_many :posts

  has_many :servicehasusers
  has_many :services, through: :servicehasusers

  has_many :userhasgroups
  has_many :groups, through: :userhasgroups



end
