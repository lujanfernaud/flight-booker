class Airport < ApplicationRecord
  has_many :departures, class_name: "Flight",
                        foreign_key: "departure_airport_id"

  has_many :arrivals,   class_name: "Flight",
                        foreign_key: "arrival_airport_id"

  validates :name, :location, :iata_code, presence: true

  def self.locations
    all.map do |airport|
      [airport.location, airport.id]
    end
  end

  def location_with_code
    "#{location} (#{iata_code})"
  end
end
