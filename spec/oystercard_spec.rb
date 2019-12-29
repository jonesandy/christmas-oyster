require 'oystercard'

describe Oystercard do

  it 'has a zero balance at start' do
    expect(subject.balance).to eq(0)
  end

end
