class Oystercard

  MAX_BALANCE = 90
  MINIMUM_FARE = 3

  attr_reader :balance

  def initialize
    @balance = 0
    @in_journey = false
  end 

  def top_up(amount)
    error = "Maximum balance of #{MAX_BALANCE} exceeded!"
    raise error if max_balance_exceeded?(amount)

    @balance += amount
  end

  def touch_in
    error = "Insufficient balance for journey."
    raise error if @balance < MINIMUM_FARE

    @in_journey = true
  end

  def touch_out
    @in_journey = false
    deduct(MINIMUM_FARE)
  end

  def in_journey?
    @in_journey
  end

  private 

  def max_balance_exceeded?(amount)
    amount + @balance > MAX_BALANCE
  end

  def deduct(amount)
    @balance -= amount
  end

end
