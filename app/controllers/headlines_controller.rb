class HeadlinesController < ApplicationController
    require 'news-api'
    def index 
        @city = City.find(params[:id])
        newsapi = News.new("e23c890c69174b54b9d2e72e7ee45677")
        top_headlines = newsapi.get_top_headlines
    end

    e23c890c69174b54b9d2e72e7ee45677
end
