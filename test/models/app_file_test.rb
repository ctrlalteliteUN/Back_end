# == Schema Information
#
# Table name: app_files
#
#  id           :integer          not null, primary key
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  user_id      :integer
#  post_id      :integer
#  ruta         :text             default("-"), not null
#  file_type_id :integer          default(1), not null
#

require 'test_helper'

class AppFileTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
