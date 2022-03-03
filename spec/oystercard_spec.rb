require 'oystercard'
describe Oystercard do

  let(:station) do
    station = double("station", zone: 1)
  end
  let(:station_2) do
    station_2 = double("station_2", zone: 3)
  end
  let(:oyster_1) do
    oyster_1 = Oystercard.new
    oyster_1.top_up(10) 
    oyster_1
  end
  

  it 'initialises with a balance of 10' do
    expect(oyster_1.balance).to eq(10)
  end

  it 'tops up the card' do
    expect(oyster_1.top_up(10)).to eq(20)
  end

  it 'does not allow card to exceed max limit' do
    max_balance = Oystercard::MAX_LIMIT
    expect do 
        oyster_1.top_up(91)
    end.to raise_error "Cannot top up as you exceeded the maximum limit of #{max_balance}"
  end

  it "deducts a fare" do
    oyster_1.touch_in(station)
    oyster_1.touch_out(station_2)
    expect(oyster_1.balance).to eq (7)
  end

  describe ".touch_in" do
    it 'changes the status of the oystercard to true' do
      oyster_1.top_up(1)
      expect(oyster_1.touch_in(station)).to eq true
    end

    it 'touch_in fail if balance less than £1' do
      oyster_3 = Oystercard.new
      expect { oyster_3.touch_in(station) }.to raise_error "Not enough funds on your Oystercard"
    end
  end
  describe ".touch_out" do
    it 'changes the status of the oystercard to false' do
      oyster_1.touch_in(station)
      expect(oyster_1.touch_out(station_2)).to eq false
    end
  end

    it 'deducts balance when touching out' do
      oyster_1.touch_in(station)
      fare = 3
      expect { oyster_1.touch_out(station_2) }.to change{ oyster_1.balance }.by(-fare)
    end
  end
