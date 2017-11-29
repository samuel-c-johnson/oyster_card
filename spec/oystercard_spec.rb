require './lib/oystercard.rb'

describe OysterCard do
  subject(:card) { described_class.new }
  let(:station) {double(:my_station)}
  MONEY = 10

  describe 'balance' do
    it 'will check that the balance of a new card is 0' do
      expect( card.balance ).to eq(0)
    end

    describe '#top up' do
      it 'will top up the balance of an oyster card' do
        expect(card).to respond_to(:top_up).with(1).argument
        expect( card.top_up(MONEY) ).to eq(MONEY)
      end

      it 'will prevent the card being topped up beyond the max of £90' do
        expect { card.top_up(100) }.to raise_error 'card max of £90 exceeded'
      end
    end


  end
  describe '#touch_in, #touch_out' do
    describe '#touch_in' do
      it 'allows a customer to touch in to start journey' do
        expect(card).to respond_to(:touch_in)
        card.top_up(MONEY)
        card.touch_in(station)
        expect(card.in_journey?).to be(true)
      end

      it 'prevents user from touching in when in journey' do
        card.top_up(MONEY)
        card.touch_in(station)
        expect{card.touch_in(station)}.to raise_error 'You need to touch out before starting new journey'
      end

      it 'stops tapping in with less than £1 on card' do
        expect{card.touch_in(station)}.to raise_error 'Insufficient funds for travel, please top up your card'
      end

      it 'records the station which the user is travelling from' do
        card.top_up(MONEY)
        card.touch_in(station)
        expect(card.entry_station).to eq(station)
      end


    end

    describe '#touch_out' do
      before do
        card.top_up(MONEY)
        card.touch_in(station)
      end
      it 'allows a customer to touch out and complete a journey' do
        expect(card).to respond_to(:touch_out)
        card.touch_out
        expect(card.in_journey?).to be(false)
      end

      it 'charges the user for the journey when they tap out' do
        expect{card.touch_out}.to change {card.balance}.by(-OysterCard::MINIMUM_FARE)
      end


      it 'prevents user from touching out when they have not touched in' do
        card.touch_out
        expect{card.touch_out}.to raise_error 'You need to touch in before ending journey'
      end

      it 'forgets the entry station on touching out' do
        card.touch_out
        expect(card.entry_station).to eq(nil)
      end


    end
  end
end
