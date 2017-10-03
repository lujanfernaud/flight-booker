class BookingsController < ApplicationController
  def show
    @booking = Booking.find(params[:id])
    find_flight
  end

  def new
    @flight_id = params[:flight_id]

    unless @flight_id
      flash[:danger] = "You need to select a flight from the list."
      return redirect_to root_path
    end

    @booking    = Booking.new
    @passengers = params[:passengers].to_i
    @passengers.times { @booking.passengers.build }
    find_flight
  end

  def create
    @booking = Booking.new(booking_params)
    find_flight

    if @booking.save
      flash[:success] = "Yay! You have successfully booked this flight!"
      redirect_to booking_path(@booking)
    else
      render :new
    end
  end

  private

    def find_flight
      @flight = @booking.flight || Flight.find(@flight_id)
    end

    def booking_params
      params.require(:booking).permit(:flight_id,
                                      passengers_attributes: [:name, :email])
    end
end
