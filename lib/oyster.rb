class Oyster
  attr_reader :balance, :MAX_VALUE
  attr_accessor :in_journey

  MIN_VALUE = 1
  MAX_VALUE = 90

  def initialize
    @balance = 0
  end

  def top_up(amount)
    if balance_exceeded?(amount) 
      raise "cannot exceed £#{MAX_VALUE}"
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
    if @balance < MIN_VALUE
      raise "not enough funds" 
    else 
     @in_journey = true
    end
  end

  def touch_out
    @in_journey = false
  end


  private 

  def balance_exceeded?(amount)
    @balance + amount > MAX_VALUE
  end 
end