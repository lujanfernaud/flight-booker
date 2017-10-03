require 'test_helper'

class AirportTest < ActiveSupport::TestCase
  def setup
    @airport = airports(:one)
  end

  test "airport is valid" do
    assert @airport.valid?
  end

  test "airport is invalid without name" do
    @airport.name = nil
    assert_not @airport.valid?, "Expected name to not be nil."
  end

  test "airport is invalid without a location" do
    @airport.location = nil
    assert_not @airport.valid?, "Expected location to not be nil."
  end

  test "airport is invalid without an iata code" do
    @airport.iata_code = nil
    assert_not @airport.valid?, "Expected iata_code to not be nil."
  end

  test "#departures" do
    assert_equal 3, @airport.departures.size
  end

  test "#arrivals" do
    assert_equal 2, @airport.arrivals.size
  end

  test "#location_with_code" do
    assert_equal "Tenerife (TFS)", @airport.location_with_code
  end

  test ".locations" do
    assert_equal (Airport.all.size - 1), Airport.locations.size
  end
end
