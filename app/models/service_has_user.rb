# == Schema Information
#
# Table name: service_has_users
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  service_id :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class ServiceHasUser < ApplicationRecord
  belongs_to :user
  belongs_to :service
end
