class CamerasController < ApplicationController
  before_action :set_camera, only: [:show, :edit, :update, :destroy]

  def index
    @cameras = Camera.all
    @categories = Camera.pluck(:category).uniq
    if params[:query].present?
      @cameras = Camera.where("name ILIKE ?", "%#{params[:query]}%")
    end
  end

  def show
    @camera = Camera.find(params[:id])
  end

  def new
    @camera = Camera.new
  end

  def create
    @camera = Camera.new(camera_params)
    @camera.user = current_user
    if @camera.save
      redirect_to camera_path(@camera)
    else
      render :new
    end
  end

  def edit
    @camera = Camera.find(params[:id])
  end

  def update
    @camera = Camera.find(params[:id])
    @camera.update(camera_params)
    redirect_to cameras_path
  end

  def destroy
    @camera = Camera.find(params[:id])
    @camera.destroy
    redirect_to dashboard_path
  end

  private

  def set_camera
    @camera = Camera.find(params[:id])
  end

  def camera_params
    params.require(:camera).permit(:name, :details, :category, :price, :year, :model, :picture_url, :picture)
  end
end
