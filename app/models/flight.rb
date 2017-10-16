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

      [flight.decorate.date_readable, flight.departure_date]
    end.uniq.compact
  end

  private

    def self.same_date_for(flight, index)
      previous_flight = Flight.all[index - 1]

      flight.decorate.date_readable == previous_flight.decorate.date_readable
    end
end
