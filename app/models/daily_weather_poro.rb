class DailyWeatherPoro
  attr_reader :time, :summary, :icon, :tempurature_high, :tempurature_low

  def initialize(data)
    # binding.pry
    @time = data[:time]
    @summary = data[:summary]
    @icon = data[:icon]
    @tempurature_high = data[:data][0].values[14]
    @tempurature_low = data[:data][0].values[16]
  end

end
