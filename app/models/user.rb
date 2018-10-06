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

  has_many :service_has_users
  has_many :services, through: :service_has_users

  has_many :user_has_groups
  has_many :groups, through: :user_has_groups


  private

  def set_score
    self.score = 5
  end

  #usuarios con el nombre de "name"
  scope :users1, -> (name) { where(name: name) }
  #usuarios que tienen como dominio de correo gmail.com

  scope :gmailEmail, -> {where("email LIKE ?", "%gmail.com")}
  #muestra solamente el name y el email de los usuarios

  scope :selectNameEmail, -> {select("name, email")}

  scope :usersServiceFutbolpluckIdEmail, -> {joins(:service).where(title:"%futbol%").pluck(:id, :email)}

end
