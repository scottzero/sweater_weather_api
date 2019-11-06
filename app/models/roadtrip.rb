class Roadtrip
  attr_reader :origin, :destination, :duration, :api_key, :id
  def initialize(trip_data, api_key)
    @id = 1
    @trip_data = trip_data
    @api_key = api_key
  end

  def origin
    @trip_data[:routes][0][:legs][0][:start_address]
  end

  def destination
    @trip_data[:routes][0][:legs][0][:end_address]
  end

  def duration
    @trip_data[:routes][0][:legs][0][:duration][:text]
  end

  def api_key
    @api_key
  end
end
