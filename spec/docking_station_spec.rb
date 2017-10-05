require 'docking_station'

describe DockingStation do
  it { is_expected.to respond_to :release_bike }
  it { is_expected.to respond_to(:dock).with(1).argument }

  describe 'upon initialization' do
    subject { DockingStation.new }
    let(:bike) { Bike.new }
    it 'defaults capacity' do
      described_class::DEFAULT_CAPACITY.times do
        subject.dock(bike)
      end
      expect { subject.dock(bike) }.to raise_error 'Docking station full'
    end
  end

  describe '#release_bike' do
    it 'releases bikes' do
      bike = Bike.new
      subject.dock(bike)
      expect(subject.release_bike).to eq bike
    end

    it 'raises an error when there are no bikes available' do
      expect { subject.release_bike }.to raise_error 'No bikes available'
    end
  end

  describe '#dock' do
    it 'docks bikes returned by user' do
      yuliya_bike = Bike.new
      expect(subject.dock(yuliya_bike)).to eq [yuliya_bike]
    end

    it 'raises an error when full' do
      subject.capacity.times { subject.dock Bike.new }
      expect { subject.dock(Bike.new) }.to raise_error 'Docking station full'
    end
  end
end
