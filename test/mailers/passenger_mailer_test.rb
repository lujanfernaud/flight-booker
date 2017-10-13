require 'test_helper'

class PassengerMailerTest < ActionMailer::TestCase
  include Rails.application.routes.url_helpers

  def setup
    @passenger = passengers(:one)
    @booking   = @passenger.bookings.last
    @flight    = @booking.flight
    @email     = PassengerMailer.booking_details(@passenger)
  end

  test "sends booking information" do
    assert_emails 1 do
      @email.deliver_now
    end

    test_email_headers
    test_email_body
  end

  private

    def test_email_headers
      assert_equal email_subject, @email.subject
      assert_equal [@passenger.email], @email.to
      assert_equal ["bookings@yawo.herokuapp.com"], @email.from
    end

    def email_subject
      "Your booking details: " +
      "#{@flight.departure_airport.location_with_code} to " \
      "#{@flight.arrival_airport.location_with_code} " \
      "[#{@flight.number}]" \
    end

    def test_email_body
      email_body = @email.text_part.body.to_s.encode("UTF-8")

      email_data.each { |data| assert_match data, email_body }

      assert_match booking_url(@booking, :host => "localhost:3000"), email_body
    end

    def email_data
      [@passenger.first_name,
       @flight.number,
       @flight.departure_airport.location_with_code,
       @flight.arrival_airport.location_with_code,
       @flight.date_readable,
       @flight.time_readable,
       @flight.arrival_time_readable,
       @flight.duration_readable,
       @passenger.full_name,
       @booking.seat]
    end
end
