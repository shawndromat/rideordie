class RsvpsController < ApplicationController
  def show
    # @rsvp = Rsvp.find(params[:id])
    @rsvp = Rsvp.find_by(url: params[:party])
    render :show
  end
end
