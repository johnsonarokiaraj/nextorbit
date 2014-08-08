class HomeController < ApplicationController
  def index
    @checkbox = WEATHER['stations']
  end
end
