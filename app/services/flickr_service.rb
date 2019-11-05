class FlickrService

  def conn(location)
      conn = Faraday.new("https://api.flickr.com/services/rest/?method=flickr.photos.search&text=#{location}skyline&api_key=#{ENV['FLICKR_API_KEY']}&per_page=1&format=json&nojsoncallback=1&extras=url_o") do |f|
      f.adapter Faraday.default_adapter
    end
  end

  def img_data(location)
    response = conn(location).get
    JSON.parse(response.body, symbolize_names: true)
  end
end
