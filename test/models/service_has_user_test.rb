# == Schema Information
#
# Table name: service_has_users
#
#  id         :bigint(8)        not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  service_id :bigint(8)
#  user_id    :bigint(8)
#
# Indexes
#
#  index_service_has_users_on_service_id  (service_id)
#  index_service_has_users_on_user_id     (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (service_id => services.id)
#  fk_rails_...  (user_id => users.id)
#

require 'test_helper'

class ServiceHasUserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
