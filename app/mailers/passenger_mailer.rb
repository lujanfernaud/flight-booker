class PassengerMailer < ApplicationMailer
  default from: "bookings@yawo.herokuapp.com"

  def booking_details(passenger)
    @passenger = passenger
    @booking   = passenger.bookings.last
    @flight    = @booking.flight
    @url       = "https://yawo.herokuapp.com"

    mail(to: "#{@passenger.full_name} <#{@passenger.email}>",
         subject: email_subject)
  end

  private

    def email_subject
      "Your booking details: " +
      "#{@flight.departure_airport.location_with_code} to " \
      "#{@flight.arrival_airport.location_with_code} " \
      "[#{@flight.number}]" \
    end
end
