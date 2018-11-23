class AddStateToServices < ActiveRecord::Migration[5.2]
  def change
    add_column :services, :state, :integer
  end
end

