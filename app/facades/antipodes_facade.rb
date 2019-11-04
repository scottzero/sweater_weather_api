class AntipodesFacade
  attr_reader :location

  def initialize(location)
    @location = location
  end

  def get_forecast
    #get coords for hong kong
    geocode_service = GeocodingService.new(@location)
    #format hong kong coords
    coordinates = geocode_service.lat_long_coords
    #pass coords to antiposed service
    antipodes_service = AntipodesService.new(coordinates)
    coordinates_for_antipode = antipodes_service.format_coords
    x = antipodes_service.antipode_response
    # {:data=>{:id=>"1", :type=>"antipode", :attributes=>{:lat=>-22.3193039, :long=>-65.8306389}}}
    # x[:data][:attributes] <---- antipode city coords
    # binding.pry
    darksky_service = DarkskyService.new(x[:data][:attributes])
    current_antipode_forecast = darksky_service.parsed_darksky_response_data
    reverse_look = ReverseLookupService.new(current_antipode_forecast)
    antipode_city = reverse_look.parsed_google_geocode_data
    antipode_name_data = antipode_city[:results][0][:formatted_address].split(",")
    antipode_name = antipode_name_data[1] + "," + antipode_name_data[2]
    forecast_summary = current_antipode_forecast[:currently][:summary]
    antipode_temp = current_antipode_forecast[:currently].values[6]
    AntipodesPoro.new(antipode_name, "antipode",forecast_summary,antipode_temp)
    # binding.pry
  end
end
