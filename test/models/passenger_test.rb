require 'test_helper'

class PassengerTest < ActiveSupport::TestCase
  def setup
    @passenger = passengers(:one)
  end

  test "is valid" do
    assert @passenger.valid?
  end

  test "is invalid without first name" do
    @passenger.first_name = nil
    assert_not @passenger.valid?
  end

  test "is invalid without last name" do
    @passenger.last_name = nil
    assert_not @passenger.valid?
  end

  test "is invalid without email" do
    @passenger.email = nil
    assert_not @passenger.valid?
  end

  test "#flights" do
    assert_equal 1, @passenger.flights.size
  end
end
