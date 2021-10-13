class SessionsController < ApplicationController
  

  def new
    render :new
  end

  def create
    @user = User.find_by_credentials({[:user][:email], params[:user][:password]})
      if @user 
        log_in_user!(@user)
        redirect_to users_url(@user)
      else
        flash.now[:errors] = ['Username/Password Invalid']
        render :new
      end
    
  end

  def destroy
    logout
    flash[:messages] = ["logged out"]
    redirect_to new_session_url
  end


  
end
