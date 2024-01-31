class BookingsController < ApplicationController
  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.user = current_user
    if @booking.save
      redirect_to camera_path(@camera)
    else
      render :new
    end
  end

  #def edit
    #@booking = Booking.find(params[:id])
  #end

  #def update
    #@booking = Booking.find(params[:id])
    #@booking.update(booking_params)
    #redirect_to cameras_path
  #end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :finish_date)
  end
end
