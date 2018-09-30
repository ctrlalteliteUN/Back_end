class CambioNombreTabla < ActiveRecord::Migration[5.2]
  def change
    rename_table :file, :archivo
  end
end
