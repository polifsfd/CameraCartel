class PagesController < ApplicationController
  def home
    @cameras = Camera.all
  end
end
