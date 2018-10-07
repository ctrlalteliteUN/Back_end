# == Schema Information
#
# Table name: records
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  service_id :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Record < ApplicationRecord
  belongs_to :user
  has_many :services
  
end
