class HomeController < ApplicationController
  require 'open-uri'

  def index
  end

  def get_stations
    @checkbox = WEATHER['stations']
    render :json => @checkbox
  end

  def get_json  
    lat = "39.008"
    long = "-74.98"
    lat = params[:lat]
    long = params[:long]
    @weather = JSON.parse(open("http://api.openweathermap.org/data/2.5/weather?lat=#{lat}&lon=#{long}").read)
    render :json => @weather
  end
end
