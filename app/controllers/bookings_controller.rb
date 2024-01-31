class BookingsController < ApplicationController

  before_action :set_booking, only: [:show, :edit, :update, :approve, :deny]
  
  def index
    @bookings = Booking.all
  end

  def show
  end

  def approve
    @booking.update(status: 'approved')
    redirect_to @booking, notice: 'Booking was successfully approved.'
  end

  def deny
    @booking.update(status: 'denied')
    redirect_to @booking, notice: 'Booking was successfully denied.'
  end

  private
    
  def set_booking
    @booking = Booking.find(params[:id])
  end
end
