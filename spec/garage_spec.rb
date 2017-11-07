require 'garage'

describe Garage do
  let(:van) { double :van }
  let(:broken_bike) { double :bike }
  let(:fixed_bike) { double :bike }

  before(:each) do
    allow(broken_bike).to receive(:broken?).and_return(true)
    allow(fixed_bike).to receive(:fix).and_return(fixed_bike)
  end

  describe 'deals with broken bikes' do
    it 'accepts bikes to fix' do
      expect(subject.accept_to_fix(broken_bike)).to eq [broken_bike]
    end

    it 'fixes a broken bike' do
      subject.accept_to_fix broken_bike
      expect(broken_bike).to receive(:fix).and_return(fixed_bike)
      subject.fix_bikes
      expect(subject.bikes_to_fix).to eq []
      expect(subject.fixed_bikes).to eq [fixed_bike]
    end

    it 'fixes multiple bikes' do
      5.times { subject.accept_to_fix broken_bike }
      expect(broken_bike).to receive(:fix).and_return(fixed_bike)
      subject.fix_bikes
    end

    xit 'sends the fixed bikes back to docking station' do
    end
  end
end
