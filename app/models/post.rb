class Post < ApplicationRecord
  belongs_to :user
  has_many :posthastags
  has_many :tags, through: :posthastags

end
