require 'test_helper'

class CreateBookingsTest < ActionDispatch::IntegrationTest
  def setup
    @flight = flights(:one)
    @departure_time = @flight.departure_date.strftime("%d %B %Y")
    @tenzin  = passengers(:one)
    @thupten = passengers(:two)
  end

  test "creates valid booking" do
    select_flight

    within "#passenger_1" do
      fill_in "First name", with: @tenzin.first_name
      fill_in "Last name",  with: @tenzin.last_name
      fill_in "Email",      with: @tenzin.email
    end

    within "#passenger_2" do
      fill_in "First name", with: @thupten.first_name
      fill_in "Last name",  with: @thupten.last_name
      fill_in "Email",      with: @thupten.email
    end

    click_on "Book this flight"
  end

  test "names are empty" do
    select_flight

    within "#passenger_1" do
      fill_in "First name", with: ""
      fill_in "Last name",  with: @tenzin.last_name
      fill_in "Email",      with: @tenzin.email
    end

    within "#passenger_2" do
      fill_in "First name", with: ""
      fill_in "Last name",  with: @thupten.last_name
      fill_in "Email",      with: @thupten.email
    end

    click_on "Book this flight"

    assert page.has_css? ".alert-danger"
  end

  test "last names are empty" do
    select_flight

    within "#passenger_1" do
      fill_in "First name", with: @tenzin.first_name
      fill_in "Last name",  with: ""
      fill_in "Email",      with: @tenzin.email
    end

    within "#passenger_2" do
      fill_in "First name", with: @thupten.first_name
      fill_in "Last name",  with: ""
      fill_in "Email",      with: @thupten.email
    end

    click_on "Book this flight"

    assert page.has_css? ".alert-danger"
  end

  test "emails are empty" do
    select_flight

    within "#passenger_1" do
      fill_in "First name", with: @tenzin.first_name
      fill_in "Last name",  with: @tenzin.last_name
      fill_in "Email",      with: ""
    end

    within "#passenger_2" do
      fill_in "First name", with: @thupten.first_name
      fill_in "Last name",  with: @thupten.last_name
      fill_in "Email",      with: ""
    end

    click_on "Book this flight"

    assert page.has_css? ".alert-danger"
  end

  private

   def select_flight
    visit root_url

    select "Tenerife", from: "From"
    select "Osaka",    from: "To"
    select @departure_time, from: "Departure date"
    select "2", from: "Passengers"

    click_on "Search"

    choose id: "flight_id_#{@flight.id}"

    click_on "Continue"
   end
end
