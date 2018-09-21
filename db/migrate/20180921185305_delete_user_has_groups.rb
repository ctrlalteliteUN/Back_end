class DeleteUserHasGroups < ActiveRecord::Migration[5.2]
  def up

    drop_table :user_has_groups
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
