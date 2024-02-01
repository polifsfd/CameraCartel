class DashboardController < ApplicationController

  def index
    @user = current_user
    @bookings = current_user.bookings
    @bookings_as_owner = current_user.bookings_as_owner
    @cameras = current_user.cameras
  end
end
