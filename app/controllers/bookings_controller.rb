class BookingsController < ApplicationController
  def new
    @flight_id = params[:flight_id]

    unless @flight_id
      flash[:danger] = "You need to select a flight from the list."
      return redirect_to root_path
    end

    @passengers = params[:passengers].to_i
    @booking    = Booking.new
    @passengers.times { @booking.passengers.build }

    @flight = Flight.find(@flight_id)
    find_airports
  end

  def show
    @booking    = Booking.find(params[:id])
    @passengers = @booking.passengers

    find_flight
    find_airports
  end

  def create
    @booking = Booking.new(booking_params)

    find_flight
    find_airports

    if @booking.save
      flash[:success] = "You have successfully booked this flight."
      redirect_to booking_path(@booking)
    else
      render :new
    end
  end

  private

    def booking_params
      params.require(:booking).permit(:flight_id,
                                      passengers_attributes: [:name, :email])
    end

    def find_flight
      @flight = @booking.flight
    end

    def find_airports
      @departure_airport = @flight.departure_airport
      @arrival_airport   = @flight.arrival_airport
    end
end
