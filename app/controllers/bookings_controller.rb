class BookingsController < ApplicationController
  before_action :set_booking, only: [:show, :edit, :update, :approve, :deny]

  def index
    @bookings = Booking.all
  end

  def show
  end

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

  def edit
    @booking = Booking.find(params[:id])
  end

  def update
    @booking = Booking.find(params[:id])
    @booking.update(booking_params)
    redirect_to cameras_path
  end


  private

  def set_booking
    @booking = Booking.find(params[:id])
  end

  def booking_params
    params.require(:booking).permit(:start_date, :finish_date)
end
