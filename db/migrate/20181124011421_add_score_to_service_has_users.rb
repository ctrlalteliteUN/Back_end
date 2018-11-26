class AddScoreToServiceHasUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :service_has_users, :score, :integer
  end
end
