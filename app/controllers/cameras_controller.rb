class CamerasController < ApplicationController
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
    redirect_to cameras_path
  end

  private

  def camera_params
    params.require(:camera).permit(:name, :details, :category, :price, :year, :model)
  end

  def set_camera
    @camera = Camera.find(params[:id])
  end
end
