class RemovePassengerFromBookings < ActiveRecord::Migration[5.1]
  def change
    remove_column :bookings, :passenger_id
  end
end
