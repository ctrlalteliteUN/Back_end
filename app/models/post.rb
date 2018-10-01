class Post < ApplicationRecord

  validates :title, presence: true, length:{minimum: 5}
  validates :body, presence: true, length:{minimum: 5}
  validates :solicitud, presence: true


  #associations
  belongs_to :user
  belongs_to :group, required: false
  has_many :posthastags
  has_many :tags, through: :posthastags

end
