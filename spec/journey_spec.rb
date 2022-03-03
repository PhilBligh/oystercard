require 'journey'
require 'station'

describe Journey do
  it 'remembers the station where you touch in' do
    subject.journey_start('waterloo')
    expect(subject.journey[:entry_station]).to eq 'waterloo'
  end

  it 'remembers the station where you touch out' do
    subject.journey_end('vauxhall')
    expect(subject.journey[:exit_station]).to eq 'vauxhall'
  end

  it 'remembers the previous journey' do
    subject.journey_start('waterloo')
    subject.journey_end('vauxhall')
    expect(subject.journey_list[0]).to eq subject.journey
  end

  it 'charges the correct fare' do
    subject.journey_start(Station.new("Waterloo", 1))
    subject.journey_end(Station.new("Vauxhall", 1))
    expect(subject.fare).to eq 1
  end

  it 'charges a penalty fare' do
    subject.journey_start(Station.new("Vauxhall", 1))
    subject.journey_end(nil)
    expect(subject.fare).to eq 6
  end

  it 'remembers all previous journeys' do
    subject.journey_start('waterloo')
    subject.journey_end('vauxhall')
    subject.journey_start('bow')
    subject.journey_end('bank')
    expect(subject.journey_list[1]).to eq subject.journey
  end
end