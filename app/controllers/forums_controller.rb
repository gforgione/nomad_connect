class ForumsController < ApplicationController

  def index
    @city = City.find(params[:city_id])
    @forums = Forum.where(city: @city)
  end
end
