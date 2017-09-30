class RemoveBoardingTimeAndGateFromBookings < ActiveRecord::Migration[5.1]
  def change
    remove_column :bookings, :boarding_time
    remove_column :bookings, :gate
  end
end
