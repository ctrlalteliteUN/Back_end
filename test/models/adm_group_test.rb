# == Schema Information
#
# Table name: adm_groups
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  group_id   :integer
#  user_id    :integer
#
# Indexes
#
#  index_adm_groups_on_group_id  (group_id)
#  index_adm_groups_on_user_id   (user_id)
#

require 'test_helper'

class AdmGroupTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
