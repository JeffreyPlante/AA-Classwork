class ApplicationController < ActionController::Base
#CSSSR

  def current_user
    @current_user = User.find_by(session_token: session[:session_token])  
  end

  def sign_in(user)
    @current_user = user
    session[:session_token] = @current_user.reset_session_token
  end

  def sign_out
    current_user.reset_session_token
    session[:session_token] = nil
  end

  def signed_in?
    !!current_user
  end

  def require_signed_in?
     redirect_to new_session_url unless signed_in?
  end
end