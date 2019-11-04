class AntipodesFacade
  attr_reader :location

  def initialize(location)
    @location = location
  end

  def get_forecast
    darksky_service = DarkskyService.new(coordinate_handler[:data][:attributes])
    current_antipode_forecast = darksky_service.parsed_darksky_response_data
    reverse_look = ReverseLookupService.new(current_antipode_forecast)
    antipode_city = reverse_look.parsed_google_geocode_data
    antipode_name_data = antipode_city[:results][0][:formatted_address].split(",")
    antipode_name = antipode_name_data[1] + "," + antipode_name_data[2]
    forecast_summary = current_antipode_forecast[:currently][:summary]
    antipode_temp = current_antipode_forecast[:currently].values[6]
    AntipodesPoro.new(antipode_name, "antipode",forecast_summary,antipode_temp)
  end

  def coordinate_handler
    geocode_service = GeocodingService.new(@location)
    coordinates = geocode_service.lat_long_coords
    antipodes_service = AntipodesService.new(coordinates)
    coordinates_for_antipode = antipodes_service.format_coords
    antipodes_service.antipode_response
  end
end
