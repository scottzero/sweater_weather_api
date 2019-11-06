class GoogleMapsService
  def initialize(origin,destination)
    @origin = origin
    @destination = destination
  end

  def conn
    Faraday.new(url: "https://maps.googleapis.com") do |f|
      f.params["origin"] = @origin
      f.params["destination"] = @destination
      f.params["key"] = ENV['GOOGLE_GEOCODE_API_KEY']
      f.adapter Faraday.default_adapter
    end
  end

  def google_maps_response
    conn.get("/maps/api/directions/json?origin=#{@origin}&destination=#{@destination}&key=#{ENV['GOOGLE_GEOCODE_API_KEY']}")
  end

  def parsed_maps_response_data
    JSON.parse(google_maps_response.body, symbolize_names: true)
  end
end
