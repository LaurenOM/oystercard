class Oyster
  attr_reader :balance

  def initialize
    @balance = 0
    @max_value = 90
  end

  def top_up(amount)
    if balance_exceeded?(amount) 
      raise "cannot exceed £#{@max_value}"
    else 
      @balance += amount
    end
  end

  private 

  def balance_exceeded?(amount)
    @balance + amount > @max_value
  end 
end