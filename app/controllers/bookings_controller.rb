class BookingsController < ApplicationController
  def new
    @passengers = params[:passengers].to_i
    @booking    = Booking.new
    @passengers.times { @booking.passengers.build }

    @flight = Flight.find(params[:flight_id])
    @departure_airport = @flight.departure_airport
    @arrival_airport   = @flight.arrival_airport
  end

  def show
    @booking    = Booking.find(params[:id])
    @passengers = @booking.passengers
    @flight     = @booking.flight
    @departure_airport = @flight.departure_airport
    @arrival_airport   = @flight.arrival_airport
  end

  def create
    @booking = Booking.new(booking_params)

    if @booking.save
      flash[:success] = "You have successfully booked this flight."
      redirect_to booking_path(@booking)
    else
      flash.now[:danger] = "Something went wrong."
      render :new
    end
  end

  private

    def booking_params
      params.require(:booking).permit(:flight_id,
                                      passengers_attributes: [:name, :email])
    end
end
