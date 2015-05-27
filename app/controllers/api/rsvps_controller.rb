class Api::RsvpsController < ApplicationController
  def show
    @rsvp = Rsvp.includes(guest_rsvps: :guest).find(params[:id])
    render :show
  end
end
