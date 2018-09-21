class CreateUserHasGroups < ActiveRecord::Migration[5.2]
  def change
    create_table :user_has_groups do |t|
      t.integer :user_id
      t.integer :group_id

      t.timestamps
    end
  end
end
