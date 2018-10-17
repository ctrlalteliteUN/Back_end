class AddGroupIdToPost < ActiveRecord::Migration[5.2]
  def change
    add_reference :posts, :group, index:true
    add_foreign_key :posts, :groups
  end
end
