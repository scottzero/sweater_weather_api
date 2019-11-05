class BackgroundPoro
  attr_reader :id, :url
  def initialize(img)
    @id = img[:photos][:photo][0][:id]
    @url = img[:photos][:photo][0][:url_o]
  end
end
