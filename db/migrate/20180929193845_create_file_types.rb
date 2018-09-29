class CreateFileTypes < ActiveRecord::Migration[5.2]
  def change
    create_table :file_types do |t|
      t.string :type, null:false

      t.timestamps
    end
  end
end
