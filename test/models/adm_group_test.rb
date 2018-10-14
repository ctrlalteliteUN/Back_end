# == Schema Information
#
# Table name: adm_groups
#
#  id         :bigint(8)        not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  group_id   :bigint(8)
#  user_id    :bigint(8)
#
# Indexes
#
#  index_adm_groups_on_group_id  (group_id)
#  index_adm_groups_on_user_id   (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (group_id => groups.id)
#  fk_rails_...  (user_id => users.id)
#

require 'test_helper'

class AdmGroupTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
