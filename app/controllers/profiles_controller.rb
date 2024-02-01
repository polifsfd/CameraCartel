class ProfilesController < ApplicationController
  before_action :set_user, only: :update

  def update
    if @user.update(user_params)
      flash[:notice] = "Your profile has been updated"
      redirect_to dashboard_path
    else
      render :update
    end
  end

  private

  def set_user
    @user = current_user
  end

  def user_params
    params.require(:user).permit(:first_name, :last_name)
  end
end
