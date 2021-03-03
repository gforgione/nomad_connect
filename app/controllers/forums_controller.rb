class ForumsController < ApplicationController
  skip_before_action :authenticate_user! 
  def index
    @city = City.find(params[:city_id])
    @forums = Forum.where(city: @city)
  end
end
