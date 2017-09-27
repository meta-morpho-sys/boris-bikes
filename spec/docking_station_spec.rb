# In spec/docking_station_spec.rb
require 'docking_station'

describe DockingStation do

  it { is_expected.to respond_to :release_bike}

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
    it { is_expected.to respond_to(:dock).with(1).argument }

    it 'docks bikes returned by user' do
      yuliya_bike = Bike.new
      expect(subject.dock(yuliya_bike)).to eq yuliya_bike
    end

    # it ' raises an error when the capacity is exceeded' do
    #   bike = Bike.new
    #   subject.dock(bike)
    #   expect { subject.dock(bike) }.to raise_error 'Docking capacity exceeded'
    # end
  end
  it {is_expected.to respond_to :bike }

  it 'returns docked bikes' do
    bike = Bike.new
    subject.dock(bike)
    expect(subject.bike).to eq bike
  end

end
