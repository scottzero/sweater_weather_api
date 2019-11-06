class PresenterFacade
  attr_reader :location

  def initialize(location)
    @location = location
  end

  def google_geocode
    geocode_access = GeocodingService.new(location)
    send_me_to_darksky = geocode_access.lat_long_coords 
    darksky(send_me_to_darksky)
  end

  def darksky(coords)
    dark_sky_access = DarkskyService.new(coords)
    weather_data = dark_sky_access.parsed_darksky_response_data
    current_data = weather_data[:currently]
    hourly_data = weather_data[:hourly]
    daily_data = weather_data[:daily]
    ForecastHandlerPoro.new(@location,current_data,hourly_data,daily_data)
  end

  def get_img(location)
    flickr_service = FlickrService.new
    img_data = flickr_service.img_data(location)
    BackgroundPoro.new(img_data)
  end
end
