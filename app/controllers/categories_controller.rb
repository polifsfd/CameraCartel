class CategoriesController < ApplicationController
  def index
    @cameras = Camera.where(category: params[:format])
    @category = params[:format]
  end

  def show
    @cameras = Camera.where(category: params[:format])
    @category = params[:format]
  end
end
