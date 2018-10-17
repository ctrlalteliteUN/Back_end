class AddColumnToAppFiles < ActiveRecord::Migration[5.2]
  def change
    add_column :app_files, :titulo, :string
  end
end
