class SessionsController < ApplicationController

  def new
    @session = Session.all
    render :new
  end

  def create
    @user = User.find_by_credentials(params[:users][:username], params[:users][:password])
    
    if @user
      session[:session_token] = @user.reset_session_token! # => new session token
      redirect_to cats_url
    else
      render json: ["Invalid username or password"]
  end

  def destroy
    
  end

end
