class BookingsController < ApplicationController

  before_action :set_booking, only: [:show, :edit, :update]
  before_action :set_camera, only: [:new, :create]

  def index
    @bookings = Booking.all
    #@bookings = current_user.bookings
  end

  def show
  end

  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.camera = @camera
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
    if params[:status] == "false"
      @booking.update(status: false)
    elsif params[:status] == "true"
      @booking.update(status: true)
    else
      @booking.update(booking_params)
    end
    redirect_to cameras_path
  end


  private

  def set_camera
    @camera = Camera.find(params[:camera_id])
  end

  def set_booking
    @booking = Booking.find(params[:id])
  end

  def booking_params
    params.require(:booking).permit(:start_date, :finish_date)
  end
end
