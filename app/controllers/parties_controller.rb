class PartiesController < ApplicationController
  before_action :check_signed_in

  private
  def check_signed_in
    redirect_to root_url unless logged_in?
  end
end