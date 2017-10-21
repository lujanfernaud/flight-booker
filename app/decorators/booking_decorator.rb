class BookingDecorator < ApplicationDecorator
  delegate_all

  def additional_info_for(passenger)
    return unless several_passengers?

    passenger_number = passenger.index + 1

    if passenger_number == 1
      "#{passenger_number} (booking owner)"
    else
      passenger_number
    end
  end

  def email_label_for(passenger)
    passenger_number = passenger.index + 1

    if passenger_number == 1
      "Email (use a valid email to receive your booking details)"
    else
      "Email"
    end
  end

  # Adjusts the zoom of the map depending on the duration of the flight.
  def map_zoom(flight)
    case flight.duration_in_hours
    when  0..1  then 8
    when  1..2  then 5
    when  2..10 then 4
    when 10..14 then 3
    else 2
    end
  end

  private

    def several_passengers?
      passengers.size > 1
    end
end
