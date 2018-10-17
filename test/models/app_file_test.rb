# == Schema Information
#
# Table name: app_files
#
#  id           :bigint(8)        not null, primary key
#  description  :string
#  ruta         :text             default("-"), not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  file_type_id :bigint(8)        default(1), not null
#  post_id      :bigint(8)
#  user_id      :bigint(8)
#
# Indexes
#
#  index_app_files_on_file_type_id  (file_type_id)
#  index_app_files_on_post_id       (post_id)
#  index_app_files_on_user_id       (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (file_type_id => file_types.id)
#  fk_rails_...  (post_id => posts.id)
#  fk_rails_...  (user_id => users.id)
#

require 'test_helper'

class AppFileTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
