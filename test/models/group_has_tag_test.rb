# == Schema Information
#
# Table name: group_has_tags
#
#  id         :integer          not null, primary key
#  group_id   :integer
#  tag_id     :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'test_helper'

class GroupHasTagTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
