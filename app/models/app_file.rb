# == Schema Information
#
# Table name: app_files
#
#  id           :bigint(8)        not null, primary key
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

class AppFile < ApplicationRecord
  #validations
  validates :ruta, presence: true
  
  #associations
  belongs_to :file_type, dependent: :destroy
  belongs_to :user, optional: true
  belongs_to :post, optional: true
  
  def crear_archivo_disco
    decode_base64_content = Base64.decode64(self[:ruta]) 
    File.open("files/#{FileType.find(AppFile.find(self[:id])[:file_type_id])[:tipo]}/#{self[:id]}.png", "wb") do |f|
      f.write(decode_base64_content)
    end
    self[:ruta] = "#{self[:id]}.png"
    self.save()
  end
end
