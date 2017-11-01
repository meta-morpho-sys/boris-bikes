require 'van'

describe Van do
  let(:docking_station) { double :docking_station }
  let(:bike) { double :bike }

  it 'has capacity' do
    expect(described_class::VAN_CAPACITY).to eq 5
  end

  context 'when retrieving a broken bike' do
    it 'retrieves the bike from the docking station' do
      allow(docking_station).to receive(:send_to_repair).and_return(bike)
      expect(subject.retrieve_bike(docking_station)).to eq [bike]
    end
  end
end
