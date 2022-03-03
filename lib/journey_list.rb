require_relative 'journey'

class JourneyList

  attr_accessor :journey_list, :trip

  def initialize
    @journey_list = []
  end

  def journey_start(station)
    @trip = Journey.new
    @trip.journey[:entry_station] = station
  end

  def journey_end(station)
    @trip.journey[:exit_station] = station
    @journey_list << @trip.journey
  end
end