require 'van'

def retrieve_bike(num, source)
  subject.retrieve(num, source)
end

def collect_bike
  subject.retrieve(1, garage)
end

describe Van do
  let(:docking_station) { double :docking_station }
  let(:bike) { double :bike }
  let(:garage) { double :garage }

  before(:each) do
    allow(docking_station).to receive(:ship).and_return([bike])
    allow(docking_station).to receive(:accept).and_return([bike])
    allow(garage).to receive(:accept).and_return([bike])
    allow(garage).to receive(:ship).and_return([bike])
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
        subject.deliver(2, garage)
      end.to change { subject.transported_bikes.size }.by(-2)
    end
  end
  context 'when managing a fixed bike' do
    it 'retrieves the bike from the garage' do
      expect(collect_bike).to eq [bike]
    end
    it 'delivers the bike to the docking station' do
      5.times { collect_bike }
      expect do
        subject.deliver(2, docking_station)
      end.to change { subject.transported_bikes.size }.by(-2)
    end
  end
end
