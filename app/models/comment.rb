# == Schema Information
#
# Table name: comments
#
#  id         :bigint(8)        not null, primary key
#  body       :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  post_id    :bigint(8)
#  user_id    :bigint(8)
#
# Indexes
#
#  index_comments_on_post_id  (post_id)
#  index_comments_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (post_id => posts.id)
#  fk_rails_...  (user_id => users.id)
#

class Comment < ApplicationRecord

  #validates :title, presence: true, length:{minimum: 5}
  validates :body, presence: true , length:{minimum: 10}

  #associations
  belongs_to :user
  belongs_to :post
end
