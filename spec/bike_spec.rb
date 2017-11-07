require 'bike'

describe Bike do
  it { is_expected.to respond_to :working? }
  it { is_expected.to respond_to :broken? }

  it 'is working when initialized' do
    expect(subject).not_to be_broken
  end

  it 'is #working?' do
    expect(subject.working?).to eq true
  end

  it 'is #broken?' do
    expect(subject.broken?).to eq false
  end

  it 'can be #reported_broken' do
    subject.report_broken
    expect(subject.broken?).to equal true
  end

  it 'does not work if broken' do
    subject.report_broken
    expect(subject).not_to be_working
  end

  it 'can be #reported_fixed' do
    subject.fix
    expect(subject).not_to be_broken
  end
end
