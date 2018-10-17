# == Schema Information
#
# Table name: services
#
#  id         :bigint(8)        not null, primary key
#  score      :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  post_id    :bigint(8)
#
# Indexes
#
#  index_services_on_post_id  (post_id)
#
# Foreign Keys
#
#  fk_rails_...  (post_id => posts.id)
#

require 'test_helper'

class ServiceTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
