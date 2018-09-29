class CreateArchivos < ActiveRecord::Migration[5.2]
  def change
    create_table :file do |t|
      t.references :user, foreign_key: true
      t.references :post, foreign_key: true
      t.text :path, null:false
      t.references :file_type,null:false ,foreign_key: true
      t.timestamps
    end
  end
end
