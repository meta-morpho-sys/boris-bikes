require 'van'

describe Van do
  let(:docking_station) { double :docking_station }
  let(:bike) { double :bike }

  context 'when retrieves a broken bike'do
    it 'retrieves the bike from the docking station' do
      expect(subject.retrieve_bike(bike)).to eq [bike]
    end
  end

end