require 'test_helper'

class BookingTest < ActiveSupport::TestCase
  test "it adds boarding time, gate and seat before saving" do
    @booking = Booking.create!(flight: flights(:one))

    assert @booking.boarding_time
    assert @booking.gate
    assert @booking.seat
  end
end
