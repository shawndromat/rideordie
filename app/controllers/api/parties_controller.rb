class Api::PartiesController < ApplicationController
  def index
    @parties = Party.all
  end
  
  def create
    @party = Party.new(party_params)
    if @party.save
      render :show
    else
      render json: @party.errors.full_messages
    end
  end

  def show
    @party = Party.find(params[:id])
    render :show
  end

  def invite
    @party = Party.find(params[:id])
    @party.invite
    render json: {rsvp_url: @party.rsvp.url}
  end
  
  private
  def party_params
    params.require(:party).permit(:name, :max_guests)
  end
end
