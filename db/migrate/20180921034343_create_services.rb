class CreateServices < ActiveRecord::Migration[5.2]
  def change
    create_table :services do |t|
      t.integer :score
      t.references :post, foreign_key: true

      t.timestamps
    end
  end
end
