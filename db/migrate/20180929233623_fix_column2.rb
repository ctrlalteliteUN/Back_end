class FixColumn2 < ActiveRecord::Migration[5.2]
  def change
    rename_column :file, :path, :ruta
  end
end
