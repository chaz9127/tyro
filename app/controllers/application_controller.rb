class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def log_in!(user)
    user.reset_session_token!
    session[:session_token] = user.session_token
  end

  def current_user
    token = session[:session_token]
    User.find_by_session_token(token)
  end

  def log_in?
    !current_user
  end

  def log_out
    user.reset_session_token!
    session[:session_token] = nil
  end

end
