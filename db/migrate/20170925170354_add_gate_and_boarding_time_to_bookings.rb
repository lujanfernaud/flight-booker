class AddGateAndBoardingTimeToBookings < ActiveRecord::Migration[5.1]
  def change
    add_column :bookings, :boarding_time, :time
    add_column :bookings, :gate, :string
  end
end
