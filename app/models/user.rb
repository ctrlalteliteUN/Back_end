# == Schema Information
#
# Table name: users
#
#  id                     :bigint(8)        not null, primary key
#  authentication_token   :string(30)
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  name                   :string
#  password               :string
#  password_confirmation  :string
#  perimission_level      :integer
#  remember_created_at    :datetime
#  reset_password_sent_at :datetime
#  reset_password_token   :string
#  score                  :float
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
# Indexes
#
#  index_users_on_authentication_token  (authentication_token) UNIQUE
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#

class User < ApplicationRecord

  acts_as_token_authenticatable

  #devise :omniauthable, omniauth_providers: [:google_oauth2]
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  #devise :database_authenticatable, :registerable,
         #:recoverable, :rememberable, :validatable

  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable, :omniauthable, omniauth_providers: [:google_oauth2]

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
  scope :users1, ->(name) { where(name: name) }

  #usuarios con el nombre de "name"
  scope :userse, ->(email) { where(email: email) }
  #usuarios que tienen como dominio de correo gmail.com

  scope :gmailEmail, -> {where("email LIKE ?", "%gmail.com")}
  #muestra solamente el name y el email de los usuarios

  scope :selectNameEmail, -> {select("name, email")}




end
