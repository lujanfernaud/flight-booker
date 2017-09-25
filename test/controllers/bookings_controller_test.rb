require 'test_helper'

class BookingsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get new_booking_url, params: { flight_id: flights(:one).id,
                                   passengers: 2,
                                   departure_airport_id: airports(:one).id,
                                   arrival_airport_id: airports(:two).id }
    assert_response :success
  end
end
