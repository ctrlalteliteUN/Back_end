# == Schema Information
#
# Table name: service_has_users
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  service_id :integer
#  user_id    :integer
#
# Indexes
#
#  index_service_has_users_on_service_id  (service_id)
#  index_service_has_users_on_user_id     (user_id)
#

require 'test_helper'

class ServiceHasUserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
