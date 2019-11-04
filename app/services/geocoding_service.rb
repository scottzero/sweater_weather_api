class GeocodingService
  attr_reader :location

  def initialize(location)
    @location = location
  end

  def google_geo_conn
    #make connection  to google geocode api
    Faraday.new(url: "https://maps.googleapis.com") do |f|
      f.params["address"] = location
      f.params["key"] = ENV['GOOGLE_GEOCODE_API_KEY']
      f.adapter Faraday.default_adapter
    end
  end

  def google_geocode_response
    #add queryparams to our url
    google_geo_conn.get("/maps/api/geocode/json?address=#{location}&key=#{ENV['GOOGLE_GEOCODE_API_KEY']}")
  end

  def parsed_google_geocode_data
    #parse our response data
    JSON.parse(google_geocode_response.body, symbolize_names: true)
  end

  def lat_long_coords
    parsed_google_geocode_data[:results][0][:geometry][:location]
    #returns => {:lat=>39.7392358, :lng=>-104.990251}
  end

end
