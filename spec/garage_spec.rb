require 'garage'

describe Garage do
  let(:van) { double :van }
  let(:broken_bike) { double :bike }
  let(:fixed_bike) { double :bike }

  before(:each) do
    allow(broken_bike).to receive(:broken?).and_return(true)
    allow(fixed_bike).to receive(:fix).and_return(false)
  end

  describe 'deals with broken bikes' do
    it 'accepts bikes to fix' do
      expect(subject.accept_to_fix(broken_bike)).to eq [broken_bike]
    end

    it 'fixes a broken bike' do
      subject.accept_to_fix broken_bike
      allow(broken_bike).to receive(:fix)
      subject.fix_bikes
    end
  end
end
