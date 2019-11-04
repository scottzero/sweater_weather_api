class CurrentWeatherPoro
  attr_reader :time, :summary, :icon, :tempurature, :humididity,
  :uv_index, :visibility, :feels_like

  def initialize(current_data)
    @time = current_data[:time]
    @summary = current_data[:summary]
    @icon = current_data[:icon]
    @tempurature = current_data[:tempurature]
    @humidity = current_data[:humidity]
    @uv_index = current_data[:uv_index]
    @visibility = current_data[:visibility]
    @feels_like = current_data[:feels_like]
  end

end
