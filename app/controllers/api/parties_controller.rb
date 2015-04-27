class Api::PartiesController < ApplicationController
  def index
    parties = Party.all
    render json: parties
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
  
  private
  def party_params
    params.require(:party).permit(:name, :max_guests)
  end
end