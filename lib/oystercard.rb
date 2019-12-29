class Oystercard

  MAX_BALANCE = 90

  attr_reader :balance

  def initialize
    @balance = 0
  end 

  def top_up(amount)
    error = "Maximum balance of #{MAX_BALANCE} exceeded!"
    raise error if max_balance_exceeded?(amount)
    
    @balance += amount
  end

  private 

  def max_balance_exceeded?(amount)
    amount + @balance > MAX_BALANCE
  end

end
