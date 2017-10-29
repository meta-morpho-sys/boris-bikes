require 'docking_station'

describe DockingStation do
  let(:bike) { double :bike }
  before(:each) do
    allow(bike).to receive(:working?).and_return(true)
    allow(bike).to receive(:broken?).and_return(false)
  end

  def dock_a_bike
    subject.dock(bike)
  end

  it { is_expected.to respond_to :release_bike }
  it { is_expected.to respond_to(:dock).with(1).argument }

  describe 'upon initialization' do
    it 'defaults capacity' do
      described_class::DEFAULT_CAPACITY.times do
        dock_a_bike
      end
      expect { dock_a_bike }.to raise_error 'Docking station is full.'
    end

    it ' accepts changes to capacity in initialization' do
      ds = DockingStation.new(50)
      expect(ds.capacity).to eq 50
    end
  end

  describe '#release_bike' do

    it 'releases working bikes' do
      dock_a_bike
      bike = subject.release_bike
      expect(bike).to be_working
    end

    it 'raises an error when there are no bikes available' do
      expect { subject.release_bike }.to raise_error 'No bikes available.'
    end

    it 'does not release broken bikes' do
      allow(bike).to receive(:broken?).and_return(true)
      dock_a_bike
      expect { subject.release_bike }.to raise_error 'No working bikes available.'
    end
  end

  describe '#dock' do
    it 'docks bikes returned by user' do
      expect(dock_a_bike).to eq [bike]
    end

    it 'raises an error when full' do
      subject.capacity.times { dock_a_bike }
      expect { dock_a_bike }.to raise_error 'Docking station is full.'
    end
  end
end
