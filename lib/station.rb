class Station
  def initialize(station_name, zone)
    @station_name = station_name
    @zone = zone
  end

  attr_reader :station_name, :zone

end