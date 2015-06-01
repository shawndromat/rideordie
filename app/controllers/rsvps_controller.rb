class RsvpsController < ApplicationController
  def index
    if params[:party]
      @rsvp = Rsvp.find_by(url: params[:party])
      render :show
    else
      @rsvps = Rsvp.all
      render :index
    end
  end
end
