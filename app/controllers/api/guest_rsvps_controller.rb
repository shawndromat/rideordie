class Api::GuestRsvpsController < ApplicationController
  def update
    @rsvp = GuestRsvp.find(params[:id])
    @rsvp.update(rsvp_attributes)
    if @rsvp.save
      render json: @rsvp
    else
      render json: @rsvp.errors.full_messages
    end
  end

  private
  def rsvp_attributes
    params.require(:guest_rsvp).permit(:status)
  end
end
