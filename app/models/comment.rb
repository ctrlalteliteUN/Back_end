# == Schema Information
#
# Table name: comments
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  post_id    :integer
#  body       :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Comment < ApplicationRecord

  #validates :title, presence: true, length:{minimum: 5}
  validates :body, presence: true , length:{minimum: 10}

  #associations
  belongs_to :user
  belongs_to :post
end
