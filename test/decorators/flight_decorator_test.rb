require 'test_helper'

class FlightDecoratorTest < Draper::TestCase
  test "is decorated" do
    flight = flights(:one).decorate
    assert flight.decorated?
  end
end
