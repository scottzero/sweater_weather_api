class RoadtripFacade

  def initialize(roadtrip_controller_params)
    #a road trip has an origin and destination
    #need to take in the users desired origin and destination
    @origin = roadtrip_controller_params[:origin]
    @destination = roadtrip_controller_params[:destination]
    @api_key = roadtrip_controller_params[:api_key]
  end

  def roadtrip_data
    #send them to google maps service
    maps_access = GoogleMapsService.new(@origin,@destination)
    data = maps_access.parsed_maps_response_data
    Roadtrip.new(data,@api_key)
  end
end
