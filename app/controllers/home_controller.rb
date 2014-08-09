class HomeController < ApplicationController
  require 'open-uri'

  def index
  end

  def get_stations
    if WEATHER['stations']
      @checkbox = WEATHER['stations']
    else
      # Heroku hosting problem fix
      @checkbox = stations_backup
    end
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
