require 'uri'
require 'net/http'
require 'openssl'
class HeadlinesController < ApplicationController
    
    def index
        @city = City.find(params[:city_id]).name
        url = URI("https://webit-news-search.p.rapidapi.com/search?q=#{@city}&language=en&number=10")

        http = Net::HTTP.new(url.host, url.port)
        http.use_ssl = true
        http.verify_mode = OpenSSL::SSL::VERIFY_NONE

        request = Net::HTTP::Get.new(url)
        request["x-rapidapi-key"] = '91fd979ce5mshf7db22bf15c5c2fp1c0523jsn24d1ce702bc1'
        request["x-rapidapi-host"] = 'webit-news-search.p.rapidapi.com'

        response = http.request(request)
        jsonhash = JSON.parse(response.read_body).deep_symbolize_keys
        @news_results = jsonhash[:data][:results]
    end

end


