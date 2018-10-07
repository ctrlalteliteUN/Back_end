# == Schema Information
#
# Table name: user_has_groups
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  group_id   :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'test_helper'

class UserHasGroupTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
