class RoadTripFacade

  def initialize(road_trip_data)
    #a road trip has an origin and destination
    #need to take in the users desired origin and destination
    @origin = road_trip_data[:origin]
    @destination = road_trip_Data[:destination]
  end

  def roadtrip_data
    #send them to google maps service
    geocode_access = GoogleMaps.new(@origin,@destination)
  end
end
