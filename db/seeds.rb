#
# Airports.
#

puts "Creating airports..."

Airport.create!(name: "Tenerife South Airport (Reina Sofia)",
                location: "Tenerife",
                iata_code: "TFS",
                latitude: 28.045,
                longitude: -16.5752777778)

Airport.create!(name: "El Hierro Airport",
                location: "El Hierro",
                iata_code: "VDE",
                latitude: 27.81472,
                longitude: -17.88694)

Airport.create!(name: "Zurich Airport",
                location: "Zurich",
                iata_code: "ZRH",
                latitude: 47.4605555556,
                longitude: 8.55)

Airport.create!(name: "Kansai International Airport",
                location: "Osaka",
                iata_code: "KIX",
                latitude: 34.4341666667,
                longitude: 135.232777778)

Airport.create!(name: "Paro Airport",
                location: "Paro",
                iata_code: "PBH",
                latitude: 27.4088194,
                longitude: 89.4205806)

Airport.create!(name: "Peruggia San Francesco d'Assisi Airport",
                location: "Peruggia",
                iata_code: "PEG",
                latitude: 43.09583,
                longitude: 12.51306)

Airport.create!(name: "Honolulu International Airport",
                location: "Honolulu",
                iata_code: "HNL",
                latitude: 21.3258333333,
                longitude: -157.9216666667)

Airport.create!(name: "Shanghai Pudong International Airport",
                location: "Shanghai",
                iata_code: "PVG",
                latitude: 31.1477777778,
                longitude: 121.7980555556)

Airport.create!(name: "Vancouver International Airport",
                location: "Vancouver",
                iata_code: "YVR",
                latitude: 49.1919444444,
                longitude: -123.1813888889)

Airport.create!(name: "Vienna International Airport",
                location: "Vienna",
                iata_code: "VIE",
                latitude: 48.1097222222,
                longitude: 16.5697222222)

Airport.create!(name: "San Francisco International Airport",
                location: "San Francisco",
                iata_code: "SFO",
                latitude: 37.6180555556,
                longitude: -122.3786111111)

Airport.create!(name: "Marseille Provence Airport",
                location: "Marseille",
                iata_code: "MRS",
                latitude: 43.4369444444,
                longitude: 5.2183333333)

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

# Tenerife - El Hierro

4.times do |n|
  tenerife_south.departures.build(
    arrival_airport_id: 2,
    departure_date: in_a_month,
    departure_time: random_hours(n),
    duration: 40
  )
end

4.times do |n|
  tenerife_south.departures.build(
    arrival_airport_id: 2,
    departure_date: in_a_month + 1.week,
    departure_time: random_hours(n),
    duration: 40
  )
end

4.times do |n|
  tenerife_south.departures.build(
    arrival_airport_id: 2,
    departure_date: in_a_month + 2.weeks,
    departure_time: random_hours(n),
    duration: 40
  )
end

4.times do |n|
  tenerife_south.departures.build(
    arrival_airport_id: 2,
    departure_date: in_a_month + 3.weeks,
    departure_time: random_hours(n),
    duration: 40
  )
end

# Tenerife - Zurich

4.times do |n|
  tenerife_south.departures.build(
    arrival_airport_id: 3,
    departure_date: in_a_month,
    departure_time: random_hours(n),
    duration: 260
  )
end

4.times do |n|
  tenerife_south.departures.build(
    arrival_airport_id: 3,
    departure_date: in_a_month + 1.week,
    departure_time: random_hours(n),
    duration: 260
  )
end

4.times do |n|
  tenerife_south.departures.build(
    arrival_airport_id: 3,
    departure_date: in_a_month + 2.weeks,
    departure_time: random_hours(n),
    duration: 260
  )
end

4.times do |n|
  tenerife_south.departures.build(
    arrival_airport_id: 3,
    departure_date: in_a_month + 3.weeks,
    departure_time: random_hours(n),
    duration: 260
  )
end

# Tenerife - Osaka

4.times do |n|
  tenerife_south.departures.build(
    arrival_airport_id: 4,
    departure_date: in_a_month,
    departure_time: random_hours(n),
    duration: 960
  )
end

4.times do |n|
  tenerife_south.departures.build(
    arrival_airport_id: 4,
    departure_date: in_a_month + 1.week,
    departure_time: random_hours(n),
    duration: 960
  )
end

4.times do |n|
  tenerife_south.departures.build(
    arrival_airport_id: 4,
    departure_date: in_a_month + 2.weeks,
    departure_time: random_hours(n),
    duration: 960
  )
end

4.times do |n|
  tenerife_south.departures.build(
    arrival_airport_id: 4,
    departure_date: in_a_month + 3.weeks,
    departure_time: random_hours(n),
    duration: 960
  )
end

# Tenerife - Paro

4.times do |n|
  tenerife_south.departures.build(
    arrival_airport_id: 5,
    departure_date: in_a_month,
    departure_time: random_hours(n),
    duration: 784
  )
end

4.times do |n|
  tenerife_south.departures.build(
    arrival_airport_id: 5,
    departure_date: in_a_month + 1.week,
    departure_time: random_hours(n),
    duration: 784
  )
end

4.times do |n|
  tenerife_south.departures.build(
    arrival_airport_id: 5,
    departure_date: in_a_month + 2.weeks,
    departure_time: random_hours(n),
    duration: 784
  )
end

4.times do |n|
  tenerife_south.departures.build(
    arrival_airport_id: 5,
    departure_date: in_a_month + 3.weeks,
    departure_time: random_hours(n),
    duration: 784
  )
end

# Tenerife - Peruggia

4.times do |n|
  tenerife_south.departures.build(
    arrival_airport_id: 6,
    departure_date: in_a_month,
    departure_time: random_hours(n),
    duration: 261
  )
end

4.times do |n|
  tenerife_south.departures.build(
    arrival_airport_id: 6,
    departure_date: in_a_month + 1.week,
    departure_time: random_hours(n),
    duration: 261
  )
end

4.times do |n|
  tenerife_south.departures.build(
    arrival_airport_id: 6,
    departure_date: in_a_month + 2.weeks,
    departure_time: random_hours(n),
    duration: 261
  )
end

4.times do |n|
  tenerife_south.departures.build(
    arrival_airport_id: 6,
    departure_date: in_a_month + 3.weeks,
    departure_time: random_hours(n),
    duration: 261
  )
end

# Tenerife - Honolulu

4.times do |n|
  tenerife_south.departures.build(
    arrival_airport_id: 7,
    departure_date: in_a_month,
    departure_time: random_hours(n),
    duration: 1010
  )
end

4.times do |n|
  tenerife_south.departures.build(
    arrival_airport_id: 7,
    departure_date: in_a_month + 1.week,
    departure_time: random_hours(n),
    duration: 1010
  )
end

4.times do |n|
  tenerife_south.departures.build(
    arrival_airport_id: 7,
    departure_date: in_a_month + 2.weeks,
    departure_time: random_hours(n),
    duration: 1010
  )
end

4.times do |n|
  tenerife_south.departures.build(
    arrival_airport_id: 7,
    departure_date: in_a_month + 3.weeks,
    departure_time: random_hours(n),
    duration: 1010
  )
end

# Tenerife - Shanghai

4.times do |n|
  tenerife_south.departures.build(
    arrival_airport_id: 8,
    departure_date: in_a_month,
    departure_time: random_hours(n),
    duration: 933
  )
end

4.times do |n|
  tenerife_south.departures.build(
    arrival_airport_id: 8,
    departure_date: in_a_month + 1.week,
    departure_time: random_hours(n),
    duration: 933
  )
end

4.times do |n|
  tenerife_south.departures.build(
    arrival_airport_id: 8,
    departure_date: in_a_month + 2.weeks,
    departure_time: random_hours(n),
    duration: 933
  )
end

4.times do |n|
  tenerife_south.departures.build(
    arrival_airport_id: 8,
    departure_date: in_a_month + 3.weeks,
    departure_time: random_hours(n),
    duration: 933
  )
end

# Tenerife - Vancouver

4.times do |n|
  tenerife_south.departures.build(
    arrival_airport_id: 9,
    departure_date: in_a_month,
    departure_time: random_hours(n),
    duration: 686
  )
end

4.times do |n|
  tenerife_south.departures.build(
    arrival_airport_id: 9,
    departure_date: in_a_month + 1.week,
    departure_time: random_hours(n),
    duration: 686
  )
end

4.times do |n|
  tenerife_south.departures.build(
    arrival_airport_id: 9,
    departure_date: in_a_month + 2.weeks,
    departure_time: random_hours(n),
    duration: 686
  )
end

4.times do |n|
  tenerife_south.departures.build(
    arrival_airport_id: 9,
    departure_date: in_a_month + 3.weeks,
    departure_time: random_hours(n),
    duration: 686
  )
end

# Tenerife - Vienna

4.times do |n|
  tenerife_south.departures.build(
    arrival_airport_id: 10,
    departure_date: in_a_month,
    departure_time: random_hours(n),
    duration: 300
  )
end

4.times do |n|
  tenerife_south.departures.build(
    arrival_airport_id: 10,
    departure_date: in_a_month + 1.week,
    departure_time: random_hours(n),
    duration: 300
  )
end

4.times do |n|
  tenerife_south.departures.build(
    arrival_airport_id: 10,
    departure_date: in_a_month + 2.weeks,
    departure_time: random_hours(n),
    duration: 300
  )
end

4.times do |n|
  tenerife_south.departures.build(
    arrival_airport_id: 10,
    departure_date: in_a_month + 3.weeks,
    departure_time: random_hours(n),
    duration: 300
  )
end

# Tenerife - San Francisco

4.times do |n|
  tenerife_south.departures.build(
    arrival_airport_id: 11,
    departure_date: in_a_month,
    departure_time: random_hours(n),
    duration: 732
  )
end

4.times do |n|
  tenerife_south.departures.build(
    arrival_airport_id: 11,
    departure_date: in_a_month + 1.week,
    departure_time: random_hours(n),
    duration: 732
  )
end

4.times do |n|
  tenerife_south.departures.build(
    arrival_airport_id: 11,
    departure_date: in_a_month + 2.weeks,
    departure_time: random_hours(n),
    duration: 732
  )
end

4.times do |n|
  tenerife_south.departures.build(
    arrival_airport_id: 11,
    departure_date: in_a_month + 3.weeks,
    departure_time: random_hours(n),
    duration: 732
  )
end

# Tenerife - Marseille

4.times do |n|
  tenerife_south.departures.build(
    arrival_airport_id: 12,
    departure_date: in_a_month,
    departure_time: random_hours(n),
    duration: 223
  )
end

4.times do |n|
  tenerife_south.departures.build(
    arrival_airport_id: 12,
    departure_date: in_a_month + 1.week,
    departure_time: random_hours(n),
    duration: 223
  )
end

4.times do |n|
  tenerife_south.departures.build(
    arrival_airport_id: 12,
    departure_date: in_a_month + 2.weeks,
    departure_time: random_hours(n),
    duration: 223
  )
end

4.times do |n|
  tenerife_south.departures.build(
    arrival_airport_id: 12,
    departure_date: in_a_month + 3.weeks,
    departure_time: random_hours(n),
    duration: 223
  )
end

tenerife_south.save!
