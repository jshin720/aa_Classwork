class UserController < ApplicationController

  def new
    @user = User.new
    render :new
  end

  def index
    @user = User.all
    render :index
  end

  def create
    @user = User.new(user_params)
    if @user.save
      login!(@user)
      redirect_to users_url
    else
      render :new
    end
  end

  def show
    @user = User.find(params[:id])
    render :show
  end

  def user_params
    params.require(:user).permit(:name, :password)
  end
end
