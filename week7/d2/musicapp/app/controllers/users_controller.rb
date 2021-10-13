class UsersController < ApplicationController
  def new
    @user = User.new
    render :new
  end

  def index
    @user = User.all
    render :index
  end

  def show
    @user = User.find(params[:id])
    render :show
  end

  def create 
    @user = User.new(users_params)
    if @user.save
        log_in_user!(@user)
        redirect_to users_url(@user)
    else
      flash.now[:errors] = @user.errors.full_messages
      render :new
    end


  end





  def users_params
    params.require(:user).permit(:email, :password)
  end
end
