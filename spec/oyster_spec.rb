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
end