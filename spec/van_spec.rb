require 'van'

def retrieve_bike
  subject.retrieve_bike(docking_station)
end

describe Van do
  let(:docking_station) { double :docking_station }
  let(:bike) { double :bike }
  let(:garage) { double :garage}

  before(:each) do
    allow(docking_station).to receive(:send_to_repair).and_return(bike)
  end

  it 'has capacity' do
    described_class::VAN_CAPACITY.times {retrieve_bike}
    expect {retrieve_bike}.to raise_error 'Van is full.'
  end

  context 'when managing a broken bike' do
    it 'retrieves the bike from the docking station' do
      allow(docking_station).to receive(:send_to_repair).and_return(bike)
      expect(retrieve_bike).to eq [bike]
    end
    it 'delivers the bike to the garage' do
      3.times { retrieve_bike }
      expect{ subject.deliver_bike(2, garage) }.to change { subject.transported_bikes.size }.by(-2)
    end

  end
end
