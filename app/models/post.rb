class Post < ApplicationRecord

  validates :title, presence: true, length:{minimun: 5}
  validates :body, presence: true, length:{minimun: 5}
  validates :solicitud, presence: true


  #associations
  belongs_to :user
  has_many :posthastags
  has_many :tags, through: :posthastags

end
