require 'oystercard'

describe Oystercard do

  let(:card) { described_class.new }

  it 'has a zero balance at start' do
    expect(card.balance).to eq(0)
  end

  describe '#top_up' do

    it { is_expected.to respond_to(:top_up).with(1).argument }

    it 'tops up balance' do
      expect { card.top_up(1) }.to change{ card.balance }.by 1
    end

    it 'raises an error if max balance exceeded' do
      max_balance = Oystercard::MAX_BALANCE
      card.top_up(max_balance)
      expect{ card.top_up(1) }.to raise_error('Maximum balance exceeded!')
    end

  end

end
