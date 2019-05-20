require 'station'

describe Station do 
  let(:station) { Station.new("Barking", 1) }

  it 'exposes a name variable' do 
    expect(station.name).to eq("Barking")
  end

  it 'exposes a zone variable' do 
    expect(station.zone).to eq(1)
  end
end