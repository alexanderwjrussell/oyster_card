require 'oystercard'

describe Oystercard do
  it 'has a balance of zero' do
    expect(subject.balance).to eq(0)
  end

  describe '#top_up' do
	  it { is_expected.to respond_to(:top_up).with(1).argument }

    it 'can top up the balance' do
      expect { subject.top_up(10) }.to change{ subject.balance }.by 10
    end

    it 'should raise error if maximum balance is exceeded' do
      maxium_balance = Oystercard::MAXIMUM_BALANCE
      subject.top_up(maxium_balance)
      expect { subject.top_up(1) }.to raise_error "Maximum balance exceeded. Maximum balance allowed is #{maximum_balance}"
    end
  end
end
