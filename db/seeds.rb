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

puts "Creating airports..."

Airport.create!(name: "Tenerife South Airport (Reina Sofia)",
                location: "Tenerife",
                iata_code: "TFS")

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

puts "Creating flights..."

tenerife_south = Airport.first

def in_a_month
  1.month.from_now
end

def random_hours(number)
  ((number + 1) * rand(2..4)).hours
end

# Tenerife - Zurich

4.times do |n|
  tenerife_south.departures.build(
    arrival_airport_id: 2,
    departure_date: in_a_month + random_hours(n),
    duration: 260
  )
end

# Tenerife - Osaka

4.times do |n|
  tenerife_south.departures.build(
    arrival_airport_id: 3,
    departure_date: in_a_month + 1.week + random_hours(n),
    duration: 960
  )
end

# Tenerife - Paro

4.times do |n|
  tenerife_south.departures.build(
    arrival_airport_id: 4,
    departure_date: in_a_month + 2.weeks + random_hours(n),
    duration: 784
  )
end

# Tenerife - Honolulu

4.times do |n|
  tenerife_south.departures.build(
    arrival_airport_id: 5,
    departure_date: in_a_month + 3.weeks + random_hours(n),
    duration: 1010
  )
end

# Zurich - Tenerife

4.times do |n|
  tenerife_south.arrivals.build(
    departure_airport_id: 2,
    departure_date: in_a_month + 4.weeks + random_hours(n),
    duration: 260
  )
end

# Osaka - Tenerife

4.times do |n|
  tenerife_south.arrivals.build(
    departure_airport_id: 3,
    departure_date: in_a_month + 5.weeks + random_hours(n),
    duration: 960
  )
end

# Paro - Tenerife

4.times do |n|
  tenerife_south.arrivals.build(
    departure_airport_id: 4,
    departure_date: in_a_month + 6.weeks + random_hours(n),
    duration: 784
  )
end

# Honolulu - Tenerife

4.times do |n|
  tenerife_south.arrivals.build(
    departure_airport_id: 5,
    departure_date: in_a_month + 7.weeks + random_hours(n),
    duration: 1010
  )
end

tenerife_south.save!
