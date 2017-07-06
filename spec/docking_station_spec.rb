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
end

