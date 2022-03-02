require 'station'

describe Station do
  it 'a customer can find out what zone a station is in' do
    station = Station.new("Waterloo", 1)
    expect(station.zone).to eq 1
  end

  it 'a customer can find out the name of a station' do
    station = Station.new("Waterloo", 1)
    expect(station.station_name).to eq "Waterloo"
  end

end