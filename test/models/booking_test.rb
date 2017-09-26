require 'test_helper'

class BookingTest < ActiveSupport::TestCase
  test "it adds boarding time, gate and seat before saving" do
    @booking = Booking.new(flight: flights(:one))
    @passenger = passengers(:one)
    @booking.passengers.new(name: @passenger.name,
                            email: @passenger.email)
    @booking.save!

    assert @booking.boarding_time
    assert @booking.gate
    assert @booking.seat
  end
end
