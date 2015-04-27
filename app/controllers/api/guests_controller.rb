class Api::GuestsController < ApplicationController
  def update
    @guest = Guest.find(params[:id])
    if @guest.update(guest_params)
      render json: @guest
    else
      render json: @guest.errors.full_messages
    end
  end

  def guest_params
    params.require(:guest).permit(:name, :party_id)
  end
end