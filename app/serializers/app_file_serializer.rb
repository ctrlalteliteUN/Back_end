class AppFileSerializer < ActiveModel::Serializer
  attributes :id,:ruta,:created_at,:updated_at,:file_type_id,:post_id,:user_id
  
  belongs_to :file_type, dependent: :destroy
  belongs_to :user, optional: true
  belongs_to :post, optional: true
end
