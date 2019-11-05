class PresenterFacade
  attr_reader :location

  def initialize(location)
    @location = location
  end
  #access to geocoding service, returns coordinates to darksky method
  def google_geocode
    geocode_access = GeocodingService.new(location)
    send_me_to_darksky = geocode_access.lat_long_coords #gets us coords
    darksky(send_me_to_darksky)
  end
  #pass in our lat and long from google_geocode method
  def darksky(coords)
    dark_sky_access = DarkskyService.new(coords)
    weather_data = dark_sky_access.parsed_darksky_response_data
    current_data = weather_data[:currently]
    hourly_data = weather_data[:hourly]
    daily_data = weather_data[:daily]
    ForecastHandlerPoro.new(@location,current_data,hourly_data,daily_data)
    binding.pry
  end
end
