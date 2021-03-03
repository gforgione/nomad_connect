class CitiesController < ApplicationController
  skip_before_action :authenticate_user! 

  def home
    @cities = City.all
  end

  def show
    @city = City.find(params[:id])
  end

end
