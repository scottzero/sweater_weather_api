class RoadtripSerializer
  include FastJsonapi::ObjectSerializer
    attributes :id, :api_key, :origin, :destination, :duration
end
