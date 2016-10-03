require 'spec_helper'

  describe OysterCard do

    it "has a balance of 0 on creation" do
      expect(subject.balance).to eq(0)
    end

    describe '#top_up' do
      it 'balance is updated when topped up' do
        subject.top_up(10)
        expect(subject.balance).to eq(10)
      end

      it "only allows up to a maximum initial balance on the card" do
        maximum = OysterCard::MAXIMUM_BALANCE
        expect{subject.top_up(maximum + 1)}.to raise_error "Exceeded maximum balance of £#{maximum}"
      end

      it "can't top up more than the maximum balance" do
        maximum = OysterCard::MAXIMUM_BALANCE
        subject.top_up(maximum)
        expect{subject.top_up(10)}.to raise_error "Exceeded maximum balance of £#{maximum}"
      end
    end

    describe '#debit' do
      it 'debits the balance when used for travel' do
        subject = OysterCard.new(10)
        expect(subject.debit(10)).to eq(0)

      end
    end

    describe '#in_journey?' do
      it "is not in journey before interacting with a barrier" do
        expect(subject.in_journey?).to be_falsey
      end
    end

    describe '#touch_in' do
      it 'changes card status to in journey' do
        subject = OysterCard.new(OysterCard::MINIMUM_FARE)
        subject.touch_in
        expect(subject.in_journey?).to be_truthy
      end

      it 'checks to ensure balance is greater than minimum charge' do
        expect{subject.touch_in}.to raise_error "Insufficient money on card"
      end
    end

    describe '#touch_out' do
      it "changes card status back to in journey = false" do
        subject = OysterCard.new(OysterCard::MINIMUM_FARE)
        subject.touch_in
        subject.touch_out
        expect(subject.in_journey?).to be_falsey
      end

      it "charges the fare on touch out" do
        subject = OysterCard.new(OysterCard::MINIMUM_FARE)
        subject.touch_in
        expect{subject.touch_out}.to change{subject.balance}.by(-OysterCard::MINIMUM_FARE)
      end
    end

  end
