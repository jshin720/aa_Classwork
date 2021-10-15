class SessionsController < ApplicationController

  before_action :require_logged_in, only: [:destroy]

  def create
    @user = User.find_by_credentials(params[:user][:name], params[:user][:password])
    if @user
      login!(@user)
      redirect_to users_url
    else
      flash.now[:errors] = @user.errors.full_messages
      render :new
    end
  end

  def new
    @session = Session.new
    render :new
  end

  def destroy
    logout!
    flash[:messages] = ["Successfully logged out!"]
    redirect_to new_session_url 
  end
end
