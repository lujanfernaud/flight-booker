class AddLatitudeAndLongitudeToAirports < ActiveRecord::Migration[5.1]
  def change
    add_column :airports, :latitude, :float
    add_column :airports, :longitude, :float
  end
end
