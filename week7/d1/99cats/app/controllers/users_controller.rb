class UsersController < ApplicationController
  def new
    @user = User.new
    render :new
  end

  def create
    user = User.new(user_params)
    if user.save
      redirect_to user_url(user)
    else
      render :new
    end
  end


  def user_params
    params.require(:users).permit(:username, :password)
  end
end
