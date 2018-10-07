# == Schema Information
#
# Table name: group_has_tags
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  group_id   :integer
#  tag_id     :integer
#
# Indexes
#
#  index_group_has_tags_on_group_id  (group_id)
#  index_group_has_tags_on_tag_id    (tag_id)
#

require 'test_helper'

class GroupHasTagTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
