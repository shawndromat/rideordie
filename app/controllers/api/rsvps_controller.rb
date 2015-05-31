class Api::RsvpsController < ApplicationController
  def show
    @rsvp = Rsvp.includes(guest_rsvps: :guest).find(params[:id])
    render :show
  end

  def update
    @rsvp = Rsvp.find(params[:id])
    @rsvp.update(rsvp_attributes)
    if @rsvp.save
      render json: @rsvp
    else
      render json: @rsvp.errors.full_messages
    end
  end

  def rsvp_attributes
    params.require(:rsvp).permit(:message)
  end
end
