# == Schema Information
#
# Table name: comments
#
#  id         :integer          not null, primary key
#  body       :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  post_id    :integer
#  user_id    :integer
#
# Indexes
#
#  index_comments_on_post_id  (post_id)
#  index_comments_on_user_id  (user_id)
#

class Comment < ApplicationRecord

  #validates :title, presence: true, length:{minimum: 5}
  validates :body, presence: true , length:{minimum: 10}

  #associations
  belongs_to :user
  belongs_to :post
end
