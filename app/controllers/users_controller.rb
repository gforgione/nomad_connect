class UsersController < ApplicationController

  def index
    @users= User.all
  end

  def show
    @user = User.find(params[:id])
  end
  def update 
    @user = User.find(params[:id])

    if @user.update(user_params)
      redirect_to @user
    else 
      redirect_to @user
    end
  end 


  def user_params
    params.require(:user).permit(:website, :github, :facebook, :twitter, :instagram)
  end
  
end
