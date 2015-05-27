class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def logged_in?
    return false unless session[:session_token]
    BCrypt::Password.new(session[:session_token]).is_password?(ENV["PASSWORD"])
  end

  def login(password)
    session[:session_token] = BCrypt::Password.create(password)
  end

  def logout
    session[:session_token] = nil
  end
end
