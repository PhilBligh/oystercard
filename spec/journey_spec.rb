require 'journey'

describe Journey do

  let(:station) do
    station = double("station", station_name: 'Waterloo', zone: 1)
  end
  let(:station_2) do
    station_2 = double("station_2", station_name: 'Vauxhall', zone: 3)
  end
  
  it 'remembers the station where you touch in' do
    subject.journey_start(station)
    expect(subject.journey[:entry_station].station_name).to eq 'Waterloo'
  end

  it 'remembers the station where you touch out' do
    subject.journey_end(station_2)
    expect(subject.journey[:exit_station].station_name).to eq 'Vauxhall'
  end

  it 'charges the correct fare' do
    subject.journey_start(station)
    subject.journey_end(station_2)
    expect(subject.fare).to eq 3
  end

end