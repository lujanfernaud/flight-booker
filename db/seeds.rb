# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

#
# Airports.
#

Airport.create!(name: "Tenerife South Airport (Reina Sofia)",
                location: "Tenerife",
                iata_code: "TFS")

Airport.create!(name: "Tenerife North Airport (Los Rodeos)",
                location: "Tenerife",
                iata_code: "TFN")

Airport.create!(name: "Zurich Airport",
                location: "Zurich",
                iata_code: "ZRH")

Airport.create!(name: "Kansai International Airport",
                location: "Osaka",
                iata_code: "KIX")

Airport.create!(name: "Paro Airport",
                location: "Paro",
                iata_code: "PBH")

Airport.create!(name: "Honolulu International Airport",
                location: "Honolulu",
                iata_code: "HNL")

#
# Flights.
#

tenerife_south = Airport.first
tenerife_north = Airport.second

# Departures.

tenerife_south.departures.build(arrival_airport_id: 3,
                               departure_date: Time.zone.now + 1.week,
                               duration: 260)

tenerife_south.departures.build(arrival_airport_id: 4,
                               departure_date: Time.zone.now + 1.week,
                               duration: 960)

tenerife_south.departures.build(arrival_airport_id: 5,
                               departure_date: Time.zone.now + 1.week,
                               duration: 784)

tenerife_south.departures.build(arrival_airport_id: 6,
                               departure_date: Time.zone.now + 1.week,
                               duration: 1010)

# Arrivals.

tenerife_south.arrivals.build(departure_airport_id: 3,
                              departure_date: Time.zone.now + 1.week,
                              duration: 260)

tenerife_south.arrivals.build(departure_airport_id: 4,
                              departure_date: Time.zone.now + 1.week,
                              duration: 960)

tenerife_south.arrivals.build(departure_airport_id: 5,
                              departure_date: Time.zone.now + 1.week,
                              duration: 784)

tenerife_south.arrivals.build(departure_airport_id: 6,
                              departure_date: Time.zone.now + 1.week,
                              duration: 1010)

tenerife_north.arrivals.build(departure_airport_id: 3,
                              departure_date: Time.zone.now + 1.week,
                              duration: 260)

tenerife_south.save!
tenerife_north.save!
