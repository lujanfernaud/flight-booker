require 'test_helper'

class SelectFlightsTest < ActionDispatch::IntegrationTest
  def setup
    @flight = flights(:one)
    @departure_time = @flight.departure_date.strftime("%d %B %Y")
  end

  test "valid flight" do
    visit root_path

    select "Tenerife", from: "From"
    select "Osaka",    from: "To"
    select @departure_time, from: "Departure date"

    click_on "Search"

    assert page.has_css? ".table"
  end

  test "same airport in origin and destination" do
    visit root_path

    select "Tenerife", from: "From"
    select "Tenerife", from: "To"

    click_on "Search"

    assert page.has_content? "no available flights"
  end
end
