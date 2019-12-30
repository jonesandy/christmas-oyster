require 'oystercard'

describe Oystercard do

  let(:card) { described_class.new }

  it 'has a zero balance at start' do
    expect(card.balance).to eq(0)
  end

  describe '#top_up' do

    it { is_expected.to respond_to(:top_up).with(1).argument }

    it 'tops up balance' do
      expect { card.top_up(1) }.to change { card.balance }.by 1
    end

    it 'raises an error if max balance exceeded' do
      max_balance = Oystercard::MAX_BALANCE
      card.top_up(max_balance)
      expect { card.top_up(1) }.to raise_error("Maximum balance of #{max_balance} exceeded!")
    end

  end

  describe '#deduct' do

    it 'deducts money' do
      card.top_up(20)

      expect { card.deduct(3) }.to change { card.balance }.by -3
    end

  end

  describe '#in_journey?' do

    it 'is initially not in journey' do

      expect(card).not_to be_in_journey

    end

  end

  describe '#touch_in' do

    it 'changes card to in journey' do
      card.touch_in

      expect(card).to be_in_journey
    end

  end

  describe '#touch_out' do

    it 'changes card to in journey' do
      card.touch_in
      card.touch_out
      
      expect(card).not_to be_in_journey
    end

  end

end
