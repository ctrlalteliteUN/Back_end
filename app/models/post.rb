# == Schema Information
#
# Table name: posts
#
#  id         :bigint(8)        not null, primary key
#  body       :text
#  solicitud  :integer
#  title      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :bigint(8)
#
# Indexes
#
#  index_posts_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
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
