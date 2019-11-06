class ForecastHandlerPoro
  attr_reader :id,
              :location,
              :current_data,
              :hourly_data,
              :daily_data

  def initialize(location,current_weather,hourly_weather,daily_weather)
    @id = 1
    @location = location
    @current_weather = current_weather
    @hourly_weather = hourly_weather
    @daily_weather = daily_weather
  end

  def current_data
    {
    "current_weather" => @current_weather[:time],
    "summary" => @current_weather[:summary],
    "icon" => @current_weather[:icon],
    "temperature" => @current_weather[:temperature],
    "humidity" => @current_weather[:humidity],
    "uvindex" => @current_weather[:uvIndex],
    "visibility" => @current_weather[:visibility],
    "feelsLike" => @current_weather[:apparentTemperature]
    }
  end

  def hourly_data
    {
    @hourly_weather[:data][0][:time] => @hourly_weather[:data][0][:temperature],
    @hourly_weather[:data][1][:time] => @hourly_weather[:data][1][:temperature],
    @hourly_weather[:data][2][:time] => @hourly_weather[:data][2][:temperature],
    @hourly_weather[:data][3][:time] => @hourly_weather[:data][3][:temperature],
    @hourly_weather[:data][4][:time] => @hourly_weather[:data][4][:temperature]
    }
  end

  def daily_data
    {
      "Summary" => @daily_weather[:data][0][:summary],
      "Todays High" => @daily_weather[:data][0][:temperatureHigh],
      "Todays Low" => @daily_weather[:data][0][:temperatureLow],
      "Humidity" => @daily_weather[:data][0][:humidity],
      "Wind Speed" => @daily_weather[:data][0][:windSpeed],
      "Cloud Cover" => @daily_weather[:data][0][:cloudCover],
      "Visibility" => @daily_weather[:data][0][:visibility]
    }
  end
end
