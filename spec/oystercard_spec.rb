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
    expect do 
        oyster_1.top_up(91)
    end.to raise_error "Cannot top up as you exceeded the maximum limit"
  end
end