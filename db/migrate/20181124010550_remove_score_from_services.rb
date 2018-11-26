class RemoveScoreFromServices < ActiveRecord::Migration[5.2]
  def change
    remove_column :services, :score, :integer
  end
end
