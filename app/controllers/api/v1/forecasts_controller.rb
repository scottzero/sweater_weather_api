class Api::V1::ForecastsController < ApplicationController

  def show
    #need location
    location = params[:location]
    #location needs to be geocoded
    geocode_me = GeocodingService.new(location)
    #get data back from geocode service
    geocoded_location = geocode_me.parsed_google_geocode_data
  end

end
