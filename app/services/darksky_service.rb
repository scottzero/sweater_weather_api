class DarkskyService
  #intialize this class with coordinates passed in
  def initialize(coords)
    binding.pry
  @coords = coords
  end

  #connect to darksky api
  def connect_darksky
    Faraday.new(url: "https://api.darksky.net") do |f|
      f.adapter Faraday.default_adapter
    end
  end

  #pass query params to connect darksky
  def darksky_response
    connect_darksky.get("/forecast/#{ENV["DARK_SKY_API_KEY"]}/#{@coords}")
  end

  #parse the response data from darksky api
  def parsed_darksky_response_data
    binding.pry
    JSON.parse(darksky_response.body, symbolize_names: true)
  end
end
