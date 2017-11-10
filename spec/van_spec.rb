require 'van'

def retrieve_bike(num, source)
  subject.retrieve_from_docking_station(num, source)
end

describe Van do
  let(:docking_station) { double :docking_station }
  let(:bike) { double :bike }
  let(:garage) { double :garage }

  before(:each) do
    allow(docking_station).to receive(:request_repair).and_return([bike])
    allow(garage).to receive(:accept_to_fix).and_return([bike])
    allow(garage).to receive(:send_back).and_return([bike])
  end

  it 'has capacity' do
    described_class::VAN_CAPACITY.times { retrieve_bike(1, docking_station) }
    expect { retrieve_bike(1, docking_station) }.to raise_error 'Van is full.'
  end

  context 'when managing a broken bike' do
    it 'retrieves the bike from the docking station' do
      expect(retrieve_bike(1, docking_station)).to eq [bike]
    end
    it 'delivers the bike to the garage' do
      3.times { retrieve_bike(1, docking_station) }
      expect do
        subject.deliver_bike(2, garage)
      end.to change { subject.transported_bikes.size }.by(-2)
    end
  end
  context 'when managing a fixed bike' do
    it 'retrieves the bike from the garage' do
      expect(subject.retrieve_from_garage(1, garage)).to eq [bike]
    end
  end
end
