class ForecastHandlerPoro
  attr_reader :location,
              :current_data,
              :hourly_data,
              :daily_data

  def initialize(location,current_data,hourly_data,daily_data)
    binding.pry
    @id = 1
    @location = location
    @current_data = current_data
    @hourly_data = hourly_data
    @daily_data = daily_data
  end

end
