class CitiesController < ApplicationController

  def home
    @cities = City.all
  end

  def show
    @city = City.find(params[:id])
  end

end
