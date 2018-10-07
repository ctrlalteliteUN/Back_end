# == Schema Information
#
# Table name: group_has_tags
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  group_id   :integer
#  tag_id     :integer
#
# Indexes
#
#  index_group_has_tags_on_group_id  (group_id)
#  index_group_has_tags_on_tag_id    (tag_id)
#

class GroupHasTag < ApplicationRecord
  belongs_to :group
  belongs_to :tag
end
