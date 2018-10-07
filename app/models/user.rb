# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  perimission_level      :integer
#  name                   :string
#  score                  :float
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#

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
  has_many :posts
  has_many :comments, through: :posts

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
  #muestra el id y el email de los usuarios que prestan un servicio en cuyo titulo contiene la palabra futbol

  scope :usersServiceFutbolpluckIdEmail, -> {joins(:posts).where("title LIKE ?", "%futbol%").pluck(:id, :email)}

end
