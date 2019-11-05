class ForecastSerializer
  include FastJsonapi::ObjectSerializer
  attributes :time, :summary, :icon, :tempurature, :humididity,
  :uv_index, :visibility, :feels_like
end
