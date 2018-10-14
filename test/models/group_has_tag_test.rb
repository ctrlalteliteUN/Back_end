# == Schema Information
#
# Table name: group_has_tags
#
#  id         :bigint(8)        not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  group_id   :bigint(8)
#  tag_id     :bigint(8)
#
# Indexes
#
#  index_group_has_tags_on_group_id  (group_id)
#  index_group_has_tags_on_tag_id    (tag_id)
#
# Foreign Keys
#
#  fk_rails_...  (group_id => groups.id)
#  fk_rails_...  (tag_id => tags.id)
#

require 'test_helper'

class GroupHasTagTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
