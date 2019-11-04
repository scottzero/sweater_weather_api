class PresenterFacade
  attr_reader :location

  def initialize(location)
    @location = location
  end
  #access to geocoding service
  def google_geocode
    geocode_access = GeocodingService.new(location)
    send_me_to_darksky = geocode_access.lat_long_coords
    binding.pry
  end
  #pass in our lat and long from google_geocode method
  def darksky
    dark_sky_access = DarkskyService.new(google_geocode)
    send_me_to_poros = dark_sky_access.parsed_darksky_response_data
  end
  #method responsible for current weather data only
  def current_weather
    CurrentWeatherPoro.new(darksky[:currently])
  end
  #method responsible for current daily data only
  def daily_weather
    DailyWeatherPoro.new(darksky[:daily])
  end
end
