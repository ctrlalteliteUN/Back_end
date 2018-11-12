class AddLatLngToPosts < ActiveRecord::Migration[5.2]
  def change
    add_column :posts, :lat, :decimal
    add_column :posts, :lng, :decimal
  end
end
