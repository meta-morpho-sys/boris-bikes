# In spec/docking_station_spec.rb
require 'docking_station'

describe DockingStation do

  it 'responds to release_bike' do # The instance is expected to respond to message release_bike.
    expect(subject).to respond_to :release_bike
  end

  it { is_expected.to respond_to :release_bike}

  it 'releases working bikes' do
    bike = subject.release_bike
    expect(bike).to be_working
  end

  it { is_expected.to respond_to(:dock).with(1).argument }

  it 'docks bikes returned by user' do
    yuliya_bike = subject.release_bike
    expect(subject.dock(yuliya_bike)).to eq yuliya_bike
  end

  it {is_expected.to respond_to :bike }

  it 'returns( kind of displays) docked bikes' do
    bike = Bike.new
    subject.dock(bike)
    expect(subject.bike).to eq bike
  end

end

