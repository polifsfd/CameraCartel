class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
    @cameras = Camera.all
  end
end
