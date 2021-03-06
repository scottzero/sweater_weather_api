class DarkskyService
  #intialize this class with coordinates passed in
  def initialize(coords)
    @lat = coords[:lat]
    @lng = coords[:lng]
  end

  #connect to darksky api
  def connect_darksky
    Faraday.new(url: "https://api.darksky.net") do |f|
      f.adapter Faraday.default_adapter
    end
  end

  #pass query params to connect darksky
  def darksky_response
    connect_darksky.get("/forecast/#{ENV["DARK_SKY_API_KEY"]}/#{@lat},#{@lng}")
  end

  #parse the response data from darksky api
  def parsed_darksky_response_data
    JSON.parse(darksky_response.body, symbolize_names: true)
  end
end
