module BookingsHelper
  def additional_info_for(passenger)
    passenger_number = passenger.index + 1

    if passenger_number == 1
      "#{passenger_number} (booking owner)"
    else
      passenger_number
    end
  end

  def several?(passengers)
    passengers && passengers > 1
  end

  def email_label_for(passenger)
    passenger_number = passenger.index + 1

    if passenger_number == 1
      "Email (use a valid email to receive the booking details)"
    else
      "Email"
    end
  end
end
