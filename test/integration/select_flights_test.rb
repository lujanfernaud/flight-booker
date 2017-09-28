require 'test_helper'

class SelectFlightsTest < ActionDispatch::IntegrationTest
  def setup
    @flight = flights(:one)
    @departure_date = @flight.departure_date.strftime("%d %B %Y")
  end

  test "valid flight" do
    visit root_path

    select_valid_data
    click_on "Search"
    choose id: "flight_id_#{@flight.id}"
    click_on "Continue"

    assert page.has_content? "Email"
  end

  test "no flight selected" do
    visit root_path

    select_valid_data
    click_on "Search"
    click_on "Continue"

    assert page.has_css? ".alert-danger"
  end

  test "same airport in origin and destination" do
    visit root_path

    select "Tenerife", from: "From"
    select "Tenerife", from: "To"

    click_on "Search"

    assert page.has_content? "no available flights"
  end

  private

    def select_valid_data
      select "Tenerife", from: "From"
      select "Osaka",    from: "To"
      select @departure_date, from: "Departure date"
    end
end
