class CamerasController < ApplicationController
  before_action :set_camera, only: [:show, :edit, :update, :destroy]

  def index
    @cameras = Camera.all
  end

  def show
    @camera = Camera.find(params[:id])
  end

  def new
    @camera = Camera.new
  end

  def create


  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def set_camera
    @camera = Camera.find(params[:id])
  end

  def camera_params
    params.require(:camera).permit(:name, :details, :category, :price, :year, :model, :image_url)
  end
end
