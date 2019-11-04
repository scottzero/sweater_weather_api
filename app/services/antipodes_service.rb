class AntipodesService
  def initialize(coordinates)
    @coordinates = coordinates
  end

  def format_coords
    binding.pry
    "#{@coordinates[:lat]},#{@coordinates[:lng]}"
  end

  def antipode_conn
    Faraday.new(url: "http://amypode.herokuapp.com") do |f|
      f.headers["api_key"] = ENV["api_key"]
      f.adapter Faraday.default_adapter
    end
  end

  def antipode_response
    x = antipode_conn.get("/api/v1/antipodes?lat=#{@coordinates[:lat]}&long=#{@coordinates[:lng]}")
    JSON.parse(x.body, symbolize_names: true)
  end

end
