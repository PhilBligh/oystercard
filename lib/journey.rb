require_relative 'station'

class Journey
  attr_reader :journey

  def initialize
    @journey = {entry_station: nil, exit_station: nil}
  end

  def journey_start(station)
    @journey[:entry_station] = station
  end

  def journey_end(station)
    @journey[:exit_station] = station
  end

  def fare
    if @journey[:entry_station] == nil || @journey[:exit_station] == nil
      return 6
    else
      (@journey[:entry_station].zone - @journey[:exit_station].zone).abs + 1
    end
  end

end
