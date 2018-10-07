# == Schema Information
#
# Table name: app_files
#
#  id           :integer          not null, primary key
#  ruta         :text             default("-"), not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  file_type_id :integer          default(1), not null
#  post_id      :integer
#  user_id      :integer
#
# Indexes
#
#  index_app_files_on_file_type_id  (file_type_id)
#  index_app_files_on_post_id       (post_id)
#  index_app_files_on_user_id       (user_id)
#

require 'test_helper'

class AppFileTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
