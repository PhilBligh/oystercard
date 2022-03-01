require 'oystercard'
describe Oystercard do

  let(:station) { double :station}
  let(:station_2) { double :station }

  it 'initialises with a balance of 0' do
    oyster_1 = Oystercard.new
    expect(oyster_1.balance).to eq(0)
  end

  it 'tops up the card' do
    oyster_1 = Oystercard.new
    expect(oyster_1.top_up(10)).to eq(10)
  end

  it 'does not allow card to exceed max limit' do
    oyster_1 = Oystercard.new
    max_balance = Oystercard::MAX_LIMIT
    expect do 
        oyster_1.top_up(91)
    end.to raise_error "Cannot top up as you exceeded the maximum limit of #{max_balance}"
  end

  it "deducts a fare" do
    oyster_1 = Oystercard.new
    oyster_1.top_up(15)
    oyster_1.touch_out(station_2)
    expect(oyster_1.balance).to eq (14)
  end

  it 'card has empty list of journeys as default' do
    expect(subject.journey_list).to eq([])
  end

  it '.touch_in and .touch_out creates @journey' do
    subject.top_up(10)
    subject.touch_in(station)
    subject.touch_out(station_2)
    expect(subject.journey).to eq ({ :entry_station => station, :exit_station => station_2 })
  end


  describe ".touch_in" do
    it 'changes the status of the oystercard to true' do
      oyster_1 = Oystercard.new
      oyster_1.top_up(1)
      expect(oyster_1.touch_in(station)).to eq true
    end

    it 'touch_in fail if balance less than £1' do
      expect { subject.touch_in(station) }.to raise_error "Not enough funds on your Oystercard"
    end

    it 'remembers the station where you touch in' do
      subject.top_up(1)
      subject.touch_in(station)
      expect(subject.entry_station).to eq station
    end

  end

  describe ".touch_out" do
    it 'changes the status of the oystercard to false' do
      oyster_1 = Oystercard.new
      expect(oyster_1.touch_out(station_2)).to eq false
      expect(subject.entry_station).to eq nil
    end

    it 'deducts balance when touching out' do
      subject.top_up(1)
      expect { subject.touch_out(station_2) }.to change{ subject.balance }.by(-Oystercard::MIN_LIMIT)
    end
  end

  describe ".in_journey?" do
    it 'returns the journey status' do
      oyster_1 = Oystercard.new
      oyster_1.top_up(1)
      expect(oyster_1.in_journey?) == false
      oyster_1.touch_in(station)
      expect(oyster_1.in_journey?) == true
    end


  end

end