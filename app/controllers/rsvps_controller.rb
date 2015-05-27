class RsvpsController < ApplicationController
  def show
    @rsvp = Rsvp.find(params[:id])
    render :show
  end
end