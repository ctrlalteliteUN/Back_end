class QuitoTablas < ActiveRecord::Migration[5.2]
  def change
    drop_table :archivo
    drop_table :archivos
    
    change_table :app_files do |t|
      t.references :user, foreign_key: true
      t.references :post, foreign_key: true
      t.text :ruta, null:false, :default => "-"
      t.references :file_type,null:false ,foreign_key: true, :default => 1
    end
  end
end
