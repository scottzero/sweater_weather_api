class ForecastHandlerPoro
  attr_reader :id,
              :location,
              :current_data,
              :hourly_data,
              :daily_data

  def initialize(location,current_data,hourly_data,daily_data)
    @id = 1
    @location = location
    @current_data = current_data
    @hourly_data = hourly_data
    @daily_data = daily_data
  end

  def current_data
    {
    current_weather => @current_weather[:time],
    summary => @current_weather[:summary],
    icon => @current_weather[:icon],
    tempurature => @current_weather[:tempurature],
    humidity => @current_weather[:humidity],
    uvindex => @current_weather[:uvindex],
    visibility => @current_weather[:visibility],
    feelsLike => @current_weather[:apparentTempurature],
    }
  end

  def daily_data
    {

    }
  end

  def hourly_data
    {
    @hourly_data[:data][0][:time] => @hourly_data[:data][0].values[5],
    @hourly_data[:data][1][:time] => @hourly_data[:data][2].values[5],
    @hourly_data[:data][2][:time] => @hourly_data[:data][3].values[5]
    }
  end
end
