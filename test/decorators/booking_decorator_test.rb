require 'test_helper'

class BookingDecoratorTest < Draper::TestCase
  test "is decorated" do
    booking = bookings(:one).decorate
    assert booking.decorated?
  end
end
