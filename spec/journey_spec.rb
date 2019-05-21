require 'journey'

describe Journey do 
  
  it "checks if the card is in in-journey" do

    expect(journey.in_journey?).to eq(false)
  
  end

end