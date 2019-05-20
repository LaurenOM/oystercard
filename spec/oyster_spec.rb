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
end