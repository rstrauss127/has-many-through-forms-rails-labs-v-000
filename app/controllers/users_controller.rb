class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
  end

  private
  def users_params
    params.require(:user).permit(:username, :email)
  end
end
