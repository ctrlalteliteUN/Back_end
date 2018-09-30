class CreateAppFiles < ActiveRecord::Migration[5.2]
  def change
    create_table :app_files do |t|
      t.timestamps
    end
  end
end
