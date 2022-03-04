require 'journey_list'
require 'journey'

describe JourneyList do

  let(:station) do
    station = double("station", station_name: 'Waterloo', zone: 1)
  end

  let(:station_2) do
    station_2 = double("station_2", station_name: 'Vauxhall', zone: 3)
  end

  let(:oyster_1) do
    oyster_1 = Oystercard.new
    oyster_1.top_up(10) 
    oyster_1
  end

it 'remembers the station where you touch in' do
  subject.journey_start(station)
  expect(subject.trip.journey[:entry_station]).to eq station
end

# it 'remembers the station where you touch out' do
#   subject.journey_end(station_2)
#   expect(subject.journey[:exit_station].station_name).to eq 'Vauxhall'
# end

# it 'remembers the previous journey' do
#   oyster_1.touch_in(station)
#   oyster_1.touch_out(station_2)
#   expect(oyster_1.journey_list[0]).to eq oyster_1.journey
# end

# it 'remembers all previous journeys' do
#   oyster_1.touch_in(station)
#   oyster_1.touch_out(station_2)
#   oyster_1.touch_in(station)
#   oyster_1.touch_out(station_2)
#   expect(oyster_1.journey_list[1]).to eq oyster_1.journey
# end

end