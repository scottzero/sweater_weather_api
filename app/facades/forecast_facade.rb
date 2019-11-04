class ForecastFacade
  attr_reader :location
  def initialize(location)
    @location = location
  end

  def google_geo_conn
    Faraday.new(url: "https://maps.googleapis.com") do |f|
      binding.pry
      f.params["address"] = location
      f.params["key"] = ENV['GOOGLE_GEOCODE_API_KEY']
      f.adapter Faraday.default_adapter
    end
  end

  def google_geocode_response
    #get our response
    google_geo_conn.get("/maps/api/geocode/json?address=#{location}&key=#{ENV['GOOGLE_GEOCODE_API_KEY']}")
  end

  def parse_google_geocode_data
    #parse our response data
    JSON.parse(google_geocode_response.body, symbolize_names: true)
  end

end
