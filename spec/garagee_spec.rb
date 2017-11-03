require 'garage'

describe Garage do
  let(:van) { double :van }
  let(:bike) { double :bike }
  before(:each) do
    expect(van).to receive(:deliver_bike).with(2, subject).and_return(bike)
  end

  describe 'fixes broken bikes' do
    it 'accepts bikes to fix' do
      van.deliver_bike(2, subject)
      expect(subject.accept_to_fix(bike)).to eq [bike]
    end
  end
end
