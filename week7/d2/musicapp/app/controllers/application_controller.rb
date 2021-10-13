class ApplicationController < ActionController::Base
  helper_method :current_user, :logged_in? # makes methods available in the views 
  
  
  def log_in_user!(user)
    session[:session_token] = user.reset_session_token!
  end

  def current_user
    @current_user ||= User.find_by(session_token: session[:session_token])
  end

  def logged_in?
    !!current_user #converts a truthy value to true, and falsey value to false
  end

  def logout
    current_user.reset_session_token
    session[:session_token] = nil
    @current_user = nil
  end

  def require_logged_in
    redirect_to new_session_url unless logged_in?
  end

  def require_logged_out
    # redirect_to users_url if logged_in?
  end

end
