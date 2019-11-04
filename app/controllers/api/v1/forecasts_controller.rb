class Api::V1::ForecastsController < ApplicationController

  def show
    #need location
    location = params[:location]
    #location needs to be geocoded
    geocode_me = GeocodingService.new(location)
    #get data back from geocode service
    geocoded_location = geocode_me.parsed_google_geocode_data
    #location latitude and longitude
    lat_long_coords = geocode_me.lat_long_coords
    #get weather using darksky api
    weather = DarkskyService.new(lat_long_coords)
    # binding.pry
  end

end
