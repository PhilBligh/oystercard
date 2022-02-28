require 'oystercard'
describe Oystercard do
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
    expect(oyster_1.deduct(10)).to eq (5)
  end

  describe ".touch_in" do
    it 'changes the status of the oystercard to true' do
      oyster_1 = Oystercard.new
      expect(oyster_1.touch_in).to eq true
    end
  end

  describe ".touch_out" do
    it 'changes the status of the oystercard to false' do
      oyster_1 = Oystercard.new
      expect(oyster_1.touch_out).to eq false
    end
  end

  describe ".in_journey?" do
    it 'returns the journey status' do
      oyster_1 = Oystercard.new
      expect(oyster_1.in_journey?) == false
      oyster_1.touch_in
      expect(oyster_1.in_journey?) == true
    end
  end

end