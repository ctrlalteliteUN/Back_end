class AddUserIdAndPostIdToAppFile < ActiveRecord::Migration[5.2]
  def change
    add_column :app_files, :description, :string
  end
end
