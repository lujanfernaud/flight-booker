require 'test_helper'

class BookingTest < ActiveSupport::TestCase
  test "it adds seat before saving" do
    @booking = Booking.new(flight: flights(:one))
    @passenger = passengers(:one)
    @booking.passengers.new(first_name: @passenger.first_name,
                            last_name: @passenger.last_name,
                            email: @passenger.email)
    @booking.save!

    assert @booking.seat
  end
end
