# == Schema Information
#
# Table name: user_has_groups
#
#  id         :bigint(8)        not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  group_id   :bigint(8)
#  user_id    :bigint(8)
#
# Indexes
#
#  index_user_has_groups_on_group_id  (group_id)
#  index_user_has_groups_on_user_id   (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (group_id => groups.id)
#  fk_rails_...  (user_id => users.id)
#

class UserHasGroupSerializer < ActiveModel::Serializer
  attributes :id,:created_at,:updated_at,:group_id,:user_id
  
  belongs_to :user
  belongs_to :group
end
