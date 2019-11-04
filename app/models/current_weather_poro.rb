class CurrentWeatherPoro
  attr_reader :time, :summary, :icon, :tempurature, :humididity,
  :uv_index, :visibility, :feels_like

  def initialize(data)
    # binding.pry
    @time = data[:time]
    @summary = data[:summary]
    @icon = data[:icon]
    @tempurature = data.values[7] #keeps coming back nil here for some reason
    @humidity = data[:humidity]
    @uv_index = data.values[16] #also comes back nil
    @visibility = data[:visibility]
  end

end
