class Oystercard

  MAX_BALANCE = 90
  MINIMUM_FARE = 3

  attr_reader :balance, :entry_station, :exit_station

  def initialize
    @balance = 0
    @entry_station = nil
    @exit_station = nil
  end 

  def top_up(amount)
    error = "Maximum balance of #{MAX_BALANCE} exceeded!"
    raise error if max_balance_exceeded?(amount)

    @balance += amount
  end

  def touch_in(station)
    error = "Insufficient balance for journey."
    raise error if @balance < MINIMUM_FARE

    @entry_station = station
  end

  def touch_out(station)
    deduct(MINIMUM_FARE)
    @entry_station = nil
    @exit_station = station
  end

  def in_journey?
    !!@entry_station
  end

  private 

  def max_balance_exceeded?(amount)
    amount + @balance > MAX_BALANCE
  end

  def deduct(amount)
    @balance -= amount
  end

end
