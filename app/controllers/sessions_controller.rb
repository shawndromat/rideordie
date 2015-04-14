class SessionsController < ApplicationController
  def create
    if password == ENV["PASSWORD"]
      login(password)
      redirect_to root_url
    else
      render :new
    end
  end

  def destroy
    logout
  end

  private
  def password
    params[:password]
  end
end
