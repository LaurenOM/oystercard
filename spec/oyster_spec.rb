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
    
    expect{oyster.top_up(95)}.to raise_error("cannot exceed £90")
  end

  it 'can deduct a fare from balance' do 
    oyster.top_up(50)

    expect(oyster.deduct(5)).to eq(45)
  end 

  it "checks if the card is in in-journey" do
  
    expect(oyster.in_journey).to eq(nil)
  
  end

  it "the card is touched in and change status to in-journey" do
    oyster.touch_in

    expect(oyster.in_journey).to eq(true)
  end 

  it "the card is touched out and status changed to false" do
    oyster.touch_in
    oyster.touch_out

    expect(oyster.in_journey).to eq(false)
  end

end