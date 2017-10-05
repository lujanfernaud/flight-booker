class Flight < ApplicationRecord
  belongs_to :departure_airport, class_name: "Airport"
  belongs_to :arrival_airport,   class_name: "Airport"

  has_many   :bookings
  has_many   :passengers, through: :bookings

  validates  :departure_airport, :arrival_airport, presence: true
  validates  :departure_date,    :duration,        presence: true

  def self.departure_dates
    all.map.with_index do |flight, index|
      next if same_date_for(flight, index)

      [flight.departure_date.strftime("%d %B %Y"), flight.departure_date]
    end.uniq.compact
  end

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

  def mid_latitude
    (departure_airport.latitude + arrival_airport.latitude) / 2
  end

  def mid_longitude
    (departure_airport.longitude + arrival_airport.longitude) / 2
  end

  private

    def self.same_date_for(flight, index)
      previous_flight = Flight.all[index - 1]

      flight.departure_date.strftime("%d %B %Y") ==
        previous_flight.departure_date.strftime("%d %B %Y")
    end

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
