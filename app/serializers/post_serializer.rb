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
#  group_id   :bigint(8)
#  user_id    :bigint(8)
#
# Indexes
#
#  index_posts_on_group_id  (group_id)
#  index_posts_on_user_id   (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (group_id => groups.id)
#  fk_rails_...  (user_id => users.id)
#

class PostSerializer < ActiveModel::Serializer
  attributes :id,:body,:solicitud,:title,:created_at,:updated_at,:user_id
  
  belongs_to :user
  belongs_to :group, required: false
  has_many :comments
  has_many :post_has_tags
  has_many :tags, through: :post_has_tags
end
