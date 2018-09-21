class Comment < ApplicationRecord

  validates :title, presence: true, length:{minimum: 5}
  validates :body, presence: true , length:{minimum: 10}

  #associations
  belongs_to :user
  belongs_to :post
end
