require 'oystercard'

describe Oystercard do

  let(:card) { described_class.new }
  let(:euston) { double :station }

  it 'has a zero balance at start' do
    expect(card.balance).to eq(0)
  end

  describe '#in_journey?' do

    it 'is initially not in journey' do
      expect(card).not_to be_in_journey
    end

  end

  describe '#top_up' do

    it 'tops up balance' do
      expect { card.top_up(1) }.to change { card.balance }.by(1)
    end

    it 'raises an error if max balance exceeded' do
      max_balance = Oystercard::MAX_BALANCE
      card.top_up(max_balance)
      expect { card.top_up(1) }.to raise_error("Maximum balance of #{max_balance} exceeded!")
    end

  end

  context 'card has balance' do

    before(:each) do
      card.top_up(20)
      card.touch_in(euston)
    end

    describe '#touch_in' do

      it 'changes card to in journey' do
        expect(card).to be_in_journey
      end

      it 'stores the touch in station' do
        expect(card.entry_station).to eq(euston)
      end
  
    end

    describe '#touch_out' do

      it 'changes card to in journey' do
        card.touch_out
  
        expect(card).not_to be_in_journey
      end

      it 'charges card with fare' do
        expect { card.touch_out }.to change { card.balance }.by(-Oystercard::MINIMUM_FARE)
      end
  
    end

  end

  context 'card has 0 balance' do

    describe '#touch_in' do

      it 'raises error if not enough funds' do

        expect { card.touch_in(euston) }.to raise_error("Insufficient balance for journey.")

      end
  
    end

  end

end
