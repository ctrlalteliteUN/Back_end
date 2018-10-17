# == Schema Information
#
# Table name: post_has_tags
#
#  id         :bigint(8)        not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  post_id    :bigint(8)
#  tag_id     :bigint(8)
#
# Indexes
#
#  index_post_has_tags_on_post_id  (post_id)
#  index_post_has_tags_on_tag_id   (tag_id)
#
# Foreign Keys
#
#  fk_rails_...  (post_id => posts.id)
#  fk_rails_...  (tag_id => tags.id)
#

class PostHasTagSerializer < ActiveModel::Serializer
  attributes :id,:created_at,:updated_at,:post_id,:tag_id
  
  belongs_to :post
  belongs_to :tag
end
