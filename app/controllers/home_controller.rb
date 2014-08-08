class HomeController < ApplicationController
  require 'open-uri'

  def index
    @checkbox = WEATHER['stations']
  end

  def get_json
    lat = "39.008"
    long = "-74.98"
    @response = JSON.parse(open("http://api.openweathermap.org/data/2.5/weather?lat=#{lat}&lon=#{long}").read)
    render :index
  end
end
