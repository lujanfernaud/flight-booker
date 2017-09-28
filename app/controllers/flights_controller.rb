class FlightsController < ApplicationController
  def index
    return unless form_submitted? && airports_selected?

    @flights = find_flights

    if @flights
      @departure_airport = departure_airport
      @arrival_airport   = arrival_airport
    end

    if @flights.empty?
      flash.now[:danger] = no_available_flights
    end
  end

  private

    def form_submitted?
      params[:commit] == "Search"
    end

    def airports_selected?
      !params[:departure_airport].blank? && !params[:arrival_airport].blank?
    end

    def find_flights
      Flight.all
            .where("departure_airport_id = ?
                    AND arrival_airport_id = ?
                    AND departure_date = ?",
                    params[:departure_airport],
                    params[:arrival_airport],
                    params[:departure_date])
            .order("departure_time")
    end

    def departure_airport
      Airport.find(params[:departure_airport])
    end

    def arrival_airport
      Airport.find(params[:arrival_airport])
    end

    def no_available_flights
      "We are sorry. There are no available flights from " \
        "#{@departure_airport.location} to #{@arrival_airport.location}."
    end
end
