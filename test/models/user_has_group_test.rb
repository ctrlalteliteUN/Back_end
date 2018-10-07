# == Schema Information
#
# Table name: user_has_groups
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  group_id   :integer
#  user_id    :integer
#
# Indexes
#
#  index_user_has_groups_on_group_id  (group_id)
#  index_user_has_groups_on_user_id   (user_id)
#

require 'test_helper'

class UserHasGroupTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
