class Flight < ApplicationRecord
  belongs_to :departure_airport, class_name: "Airport"
  belongs_to :arrival_airport,   class_name: "Airport"

  validates :departure_date, presence: true
  validates :duration,       presence: true
end
