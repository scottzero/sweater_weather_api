class ForecastSerializer
  include FastJsonapi::ObjectSerializer
    attributes :id, :location, :current_data, :hourly_data, :daily_data
end
