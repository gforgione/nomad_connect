require 'uri'
require 'net/http'
require 'openssl'
class CitiesController < ApplicationController
  skip_before_action :authenticate_user!

  def home
    @cities = City.all
  end

  def show
    @city = City.find(params[:id])
    @city_name = @city.name

    url = URI("https://weatherapi-com.p.rapidapi.com/forecast.json?q=#{@city_name}&days=3")

    http = Net::HTTP.new(url.host, url.port)
    http.use_ssl = true
    http.verify_mode = OpenSSL::SSL::VERIFY_NONE

    request = Net::HTTP::Get.new(url)
    request["x-rapidapi-key"] = '91fd979ce5mshf7db22bf15c5c2fp1c0523jsn24d1ce702bc1'
    request["x-rapidapi-host"] = 'weatherapi-com.p.rapidapi.com'

    response = http.request(request)
    jsonhash = JSON.parse(response.read_body).deep_symbolize_keys
    @weather_results = jsonhash[:current]
    @weather_time = jsonhash[:location][:localtime]
    @weather_condition_icon = @weather_results[:condition][:icon][2..-1]
  end

  def new
    @city = City.new
  end

  def create
    @city = City.new(city_params)
    if @city.save
      @forum_categories = ["General", "Work", "Adventures"]
      @forum_categories.each do |category|
        @forum = Forum.create!(name: "#{category} - #{@city.name}", group: category, city: @city)
        @chatroom = Chatroom.create!(name: "#{category} - #{@city.name}", forum: @forum)
      end
      redirect_to city_path(@city)
    else
      render :new
    end
  end

  def edit
    @city = City.find(params[:id])
  end

  def update
    @city = City.find(params[:id])
    @city.update(city_params)
    redirect_to city_path(@city)
  end

  private

  def city_params
    params.require(:city).permit(:name, :photo)
  end
end
