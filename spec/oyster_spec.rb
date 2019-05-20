require 'oyster'

describe Oyster do 
  let(:oyster) { Oyster.new }
  it 'has a balance of zero' do 
    expect(oyster.balance).to eq(0)
  end 

  it 'can top-up balance' do 
    oyster.top_up(5)

    expect(oyster.balance).to eq(5)
  end

  it 'raises an error when trying to top_up to more than £90' do
    topup_amount = Oyster::MAX_VALUE + 1

    expect{oyster.top_up(topup_amount)}.to raise_error("cannot exceed £#{Oyster::MAX_VALUE}")
  end

  it "checks if the card is in in-journey" do
  
    expect(oyster.in_journey).to eq(nil)
  
  end

  it "the card is touched in and change status to in-journey" do
    oyster.top_up(10)

    oyster.touch_in

    expect(oyster.in_journey).to eq(true)
  end 

  it "the card is touched out and status changed to false" do
    oyster.top_up(10)

    oyster.touch_in
    oyster.touch_out

    expect(oyster.in_journey).to eq(false)
  end

  it "stops you touching in when balance is lower than £1" do 
    expect{oyster.touch_in}.to raise_error("not enough funds")
  end 

  it "deducts the fare on touch out" do
    oyster.top_up(10)
  
    expect {oyster.touch_out}.to change{oyster.balance}.by(-Oyster::MIN_VALUE)
  end
end