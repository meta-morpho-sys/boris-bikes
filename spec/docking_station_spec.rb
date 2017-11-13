require 'docking_station'

describe DockingStation do
  let(:working_bike) { double :bike }
  let(:broken_bike) { double :bike }

  before(:each) do
    allow(working_bike).to receive(:working?).and_return(true)
    allow(working_bike).to receive(:broken?).and_return(false)
    allow(broken_bike).to receive(:broken?).and_return(true)
  end

  def dock(bike)
    subject.accept([bike])
  end

  def fill_with_broken_bikes
    described_class::BROKEN_BIKES_CAPACITY.times { dock(broken_bike) }
  end

  it { is_expected.to respond_to :release_bike }
  it { is_expected.to respond_to(:accept).with(1).argument }

  describe 'upon initialization' do
    it 'defaults with capacity' do
      described_class::DEFAULT_CAPACITY.times { dock(working_bike) }
      expect { dock(working_bike) }.to raise_error 'Docking station is full.'
    end

    it 'accepts changes to capacity in initialization' do
      ds = DockingStation.new(50)
      NEW_CAPACITY = 50
      expect(ds.capacity).to eq NEW_CAPACITY
    end
  end

  describe '#release_bike' do
    it 'releases working bikes' do
      dock(working_bike)
      p bike = subject.release_bike
      expect(bike).to be_working
    end

    it 'raises an error when there are no bikes available' do
      expect { subject.release_bike }.to raise_error 'No bikes available.'
    end

    it 'does not release broken bikes' do
      dock(broken_bike)
      expect do
        subject.release_bike
      end.to raise_error 'No working bikes available.'
    end
  end

  describe '#dock' do
    it 'docks bikes returned by user' do
      expect(dock(working_bike)).to eq [working_bike]
    end

    it 'raises an error when full' do
      subject.capacity.times { dock(working_bike) }
      expect { dock(working_bike) }.to raise_error 'Docking station is full.'
    end
  end

  context 'when at capacity of broken bikes' do
    before(:each) do
      fill_with_broken_bikes
    end
    it 'raises an error when attempting to dock another' do
      expect { dock(broken_bike) }.to raise_error 'Call the repair team.'
    end
    it 'releases a broken bike to the van' do
      expect do
        subject.ship(1)
      end.to change { subject.broken_bikes.size }.by(-1)
    end
  end
end
