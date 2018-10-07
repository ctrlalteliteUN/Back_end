# == Schema Information
#
# Table name: posts
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  title      :string
#  body       :text
#  solicitud  :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Post < ApplicationRecord

  validates :title, presence: true, length:{minimum: 5}
  validates :body, presence: true, length:{minimum: 5}
  validates :solicitud, presence: true


  #associations
  belongs_to :user
  belongs_to :group, required: false
  has_many :comments
  has_many :post_has_tags
  has_many :tags, through: :post_has_tags

#muestra solo el id y body de todos los post
  scope :selectIdBody, -> {select("id, body")}
  #grupos que tienen la palabra body en el body
  scope :youBody, -> {where("body LIKE ?", "%you%")}
  #Muestra el id y el title de los post que tienen la etiqueta samsung
  scope :postsTagsEpluckIdTitle, -> {joins(:tags).where("name LIKE ?", "Samsung").pluck(:id, :title)}
end
