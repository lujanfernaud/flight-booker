class Flight < ApplicationRecord
  has_many :bookings
  has_many :passengers, through: :bookings

  belongs_to :departure_airport, class_name: "Airport"
  belongs_to :arrival_airport,   class_name: "Airport"

  validates :departure_airport, :arrival_airport, presence: true
  validates :departure_date,    :duration,        presence: true

  def self.departure_dates
    all.map.with_index do |flight, index|
      next if self.same_date_for(flight, index)

      [flight.departure_date.strftime("%d %B %Y"), flight.departure_date]
    end.compact
  end

  private

    def self.same_date_for(flight, index)
      previous_flight = Flight.all[index - 1]

      flight.departure_date.strftime("%d %B %Y") ==
        previous_flight.departure_date.strftime("%d %B %Y")
    end
end
