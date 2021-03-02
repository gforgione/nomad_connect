require 'uri'
require 'net/http'
require 'openssl'
class CitiesController < ApplicationController

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
      @weather_condition_icon = @weather_results[:condition][:icon][2..-1]
      
      
  end

end
