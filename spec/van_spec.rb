require 'van'

describe Van do
  let(:docking_station) { double :docking_station }
  let(:bike) { double :bike }
  let(:garage) { double :garage}

  before(:each) do
    allow(docking_station).to receive(:send_to_repair).and_return(bike)
  end


  it 'has capacity' do
    described_class::VAN_CAPACITY.times { subject.retrieve_bike(docking_station) }
    expect { subject.retrieve_bike(docking_station) }.to raise_error 'Van is full.'
  end

  context 'when managing a broken bike' do
    it 'retrieves the bike from the docking station' do
      allow(docking_station).to receive(:send_to_repair).and_return(bike)
      expect(subject.retrieve_bike(docking_station)).to eq [bike]
    end
    xit 'delivers the broken bike to the garage' do
    end

  end
end
