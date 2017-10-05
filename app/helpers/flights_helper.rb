module FlightsHelper
  # Adjusts the zoom of the map depending on the duration of the flight.
  def map_zoom(flight)
    case duration_in_hours(flight)
    when  0..1  then 8
    when  1..2  then 5
    when  2..10 then 4
    when 10..14 then 3
    else 2
    end
  end

  private

    def duration_in_hours(flight)
      flight.duration / 60
    end
end
