class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  #set score to N on create
  before_create :set_score

  #validations
  validates :email, presence: true, uniqueness: true
  validates :name, presence: true,  length:{minimum: 5}
  validates :encrypted_password, presence: true, length:{minimum: 8}



  #associations
  has_many :comments
  has_many :posts

  has_many :servicehasusers
  has_many :services, through: :servicehasusers

  has_many :userhasgroups
  has_many :groups, through: :userhasgroups


  private

  def set_score
    self.score = 5
  end



end
