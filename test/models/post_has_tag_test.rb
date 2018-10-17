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

require 'test_helper'

class PostHasTagTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
