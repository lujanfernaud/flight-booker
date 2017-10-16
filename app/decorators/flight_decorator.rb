class FlightDecorator < ApplicationDecorator
  delegate_all

  def number
    "YWO %03d" % id
  end

  def date_readable
    departure_date.strftime("%d %B %Y")
  end

  def time_readable
    departure_time.strftime("%H:%M") + period_of_day_symbol(departure_time)
  end

  def arrival_time_readable
    arrival_time.strftime("%H:%M") + period_of_day_symbol(arrival_time)
  end

  def duration_readable
    Time.at(duration * 60).strftime("%H:%M") + " hrs"
  end

  def duration_in_hours
    duration / 60
  end

  def mid_latitude
    (departure_airport.latitude + arrival_airport.latitude) / 2
  end

  def mid_longitude
    (departure_airport.longitude + arrival_airport.longitude) / 2
  end

  private

    def period_of_day_symbol(time)
      time.hour.in?(7..19) ? sun_symbol : moon_symbol
    end

    def sun_symbol
      " " + CGI.unescapeHTML("&#9728;")
    end

    def moon_symbol
      CGI.unescapeHTML("&#9789;")
    end

    def arrival_time
      departure_time + (duration * 60)
    end
end
