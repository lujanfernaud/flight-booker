require 'test_helper'

class CreateBookingsTest < ActionDispatch::IntegrationTest
  def setup
    @flight = flights(:one)
    @departure_date = @flight.date_readable
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

    assert page.has_css? ".alert-success"
    assert_email_sent
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
    assert_email_not_sent
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
    assert_email_not_sent
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
    assert_email_not_sent
  end

  private

   def select_flight
     visit root_url

     select "Tenerife", from: "Fly from"
     select "Osaka",    from: "To"
     select @departure_date, from: "Departure date"
     select "2", from: "Passengers"

     click_on "Search"

     choose id: "flight_id_#{@flight.id}"

     click_on "Continue"
   end

   def assert_email_sent
     mail = ActionMailer::Base.deliveries.last

     assert_match @thupten.email, mail["to"].to_s
     assert_match "Your booking details", mail.subject
   end

   def assert_email_not_sent
     assert_equal [], ActionMailer::Base.deliveries
   end
end
