require 'uri'
require 'net/http'
require 'openssl'
class HeadlinesController < ApplicationController
    skip_before_action :authenticate_user!

    def index
        @city = City.find(params[:city_id])
        url = URI("https://webit-news-search.p.rapidapi.com/search?q=#{@city.name}&language=en&number=10")

        http = Net::HTTP.new(url.host, url.port)
        http.use_ssl = true
        http.verify_mode = OpenSSL::SSL::VERIFY_NONE

        request = Net::HTTP::Get.new(url)
        request["x-rapidapi-key"] = ENV["X_RAPIDAPI_KEY"]
        request["x-rapidapi-host"] = 'webit-news-search.p.rapidapi.com'

        response = http.request(request)
        jsonhash = JSON.parse(response.read_body).deep_symbolize_keys
        @news_results = jsonhash[:data][:results]
    end

end


