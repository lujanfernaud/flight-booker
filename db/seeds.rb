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
  Time.parse("#{rand(0..15) + number * 2}:#{rand(0..59)}")
end

# Tenerife - Zurich

4.times do |n|
  tenerife_south.departures.build(
    arrival_airport_id: 2,
    departure_date: in_a_month,
    departure_time: random_hours(n),
    duration: 260
  )
end

4.times do |n|
  tenerife_south.departures.build(
    arrival_airport_id: 2,
    departure_date: in_a_month + 1.week,
    departure_time: random_hours(n),
    duration: 260
  )
end

4.times do |n|
  tenerife_south.departures.build(
    arrival_airport_id: 2,
    departure_date: in_a_month + 2.weeks,
    departure_time: random_hours(n),
    duration: 260
  )
end

4.times do |n|
  tenerife_south.departures.build(
    arrival_airport_id: 2,
    departure_date: in_a_month + 3.weeks,
    departure_time: random_hours(n),
    duration: 260
  )
end

# Tenerife - Osaka

4.times do |n|
  tenerife_south.departures.build(
    arrival_airport_id: 3,
    departure_date: in_a_month,
    departure_time: random_hours(n),
    duration: 960
  )
end

4.times do |n|
  tenerife_south.departures.build(
    arrival_airport_id: 3,
    departure_date: in_a_month + 1.week,
    departure_time: random_hours(n),
    duration: 960
  )
end

4.times do |n|
  tenerife_south.departures.build(
    arrival_airport_id: 3,
    departure_date: in_a_month + 2.weeks,
    departure_time: random_hours(n),
    duration: 960
  )
end

4.times do |n|
  tenerife_south.departures.build(
    arrival_airport_id: 3,
    departure_date: in_a_month + 3.weeks,
    departure_time: random_hours(n),
    duration: 960
  )
end

# Tenerife - Paro

4.times do |n|
  tenerife_south.departures.build(
    arrival_airport_id: 4,
    departure_date: in_a_month,
    departure_time: random_hours(n),
    duration: 784
  )
end

4.times do |n|
  tenerife_south.departures.build(
    arrival_airport_id: 4,
    departure_date: in_a_month + 1.week,
    departure_time: random_hours(n),
    duration: 784
  )
end

4.times do |n|
  tenerife_south.departures.build(
    arrival_airport_id: 4,
    departure_date: in_a_month + 2.weeks,
    departure_time: random_hours(n),
    duration: 784
  )
end

4.times do |n|
  tenerife_south.departures.build(
    arrival_airport_id: 4,
    departure_date: in_a_month + 3.weeks,
    departure_time: random_hours(n),
    duration: 784
  )
end

# Tenerife - Honolulu

4.times do |n|
  tenerife_south.departures.build(
    arrival_airport_id: 5,
    departure_date: in_a_month,
    departure_time: random_hours(n),
    duration: 1010
  )
end

4.times do |n|
  tenerife_south.departures.build(
    arrival_airport_id: 5,
    departure_date: in_a_month + 1.week,
    departure_time: random_hours(n),
    duration: 1010
  )
end

4.times do |n|
  tenerife_south.departures.build(
    arrival_airport_id: 5,
    departure_date: in_a_month + 2.weeks,
    departure_time: random_hours(n),
    duration: 1010
  )
end

4.times do |n|
  tenerife_south.departures.build(
    arrival_airport_id: 5,
    departure_date: in_a_month + 3.weeks,
    departure_time: random_hours(n),
    duration: 1010
  )
end

tenerife_south.save!
