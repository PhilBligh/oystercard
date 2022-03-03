require_relative 'station'

class Journey
  attr_accessor :journey

  def initialize
    @journey = {entry_station: nil, exit_station: nil}
  end
    
  def fare
      (@journey[:entry_station].zone - @journey[:exit_station].zone).abs + 1
  end

end
