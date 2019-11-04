class AntipodesFacade
  attr_reader :location

  def initialize(location)
    @location = location
  end

  def get_forecast
    geocode_service = GeocodingService.new(@location)
    coordinates = geocode_service.lat_long_coords
    antipodes_service = AntipodesService.new(coordinates)
    coordinates_for_antipode = antipodes_service.format_coords
    binding.pry
    darksky_service = DarkskyService.new(coordinates_for_antipode)
    current_antipode_forecast = darksky_service.parsed_darksky_response_data
    binding.pry
  end
end
