# Preview all emails at http://localhost:3000/rails/mailers/passenger_mailer
class PassengerMailerPreview < ActionMailer::Preview
  def booking_details
    PassengerMailer.booking_details(Passenger.last)
  end
end
