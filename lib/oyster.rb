class Oyster
  attr_reader :balance, :max_value
  attr_accessor :in_journey

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

  def deduct(amount)
    @balance -= amount
  end

  def in_journey?
    !@in_journey
  end

  def touch_in
    @in_journey = true
  end

  def touch_out
    @in_journey = false
  end


  private 

  def balance_exceeded?(amount)
    @balance + amount > @max_value
  end 
end