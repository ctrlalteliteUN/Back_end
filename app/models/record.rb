# == Schema Information
#
# Table name: records
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  service_id :integer
#  user_id    :integer
#
# Indexes
#
#  index_records_on_service_id  (service_id)
#  index_records_on_user_id     (user_id)
#

class Record < ApplicationRecord
  belongs_to :user
  has_many :services
  
end
