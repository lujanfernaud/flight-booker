require 'test_helper'

class FlightTest < ActiveSupport::TestCase
  def setup
    @from_tfs = flights(:one)
    @from_kix = flights(:four)
    @tfs      = airports(:one)
    @kix      = airports(:two)
  end

  test "is valid" do
    assert @from_tfs.valid?
  end

  test "is invalid without departure_date" do
    @from_tfs.departure_date = nil
    assert_not @from_tfs.valid?, "Expected departure_date not to be nil."
  end

  test "is invalid without duration" do
    @from_tfs.duration = nil
    assert_not @from_tfs.valid?, "Expected duration not to be nil."
  end

  test "#departure_airport is TFS" do
    assert_equal @tfs, @from_tfs.departure_airport
  end

  test "#arrival_airport is KIX" do
    assert_equal @kix, @from_tfs.arrival_airport
  end

  test "#departure_airport is KIX" do
    assert_equal @kix, @from_kix.departure_airport
  end

  test "#arrival_airport is TFS" do
    assert_equal @tfs, @from_kix.arrival_airport
  end
end
