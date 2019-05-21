class Oyster
  attr_reader :balance, :MAX_VALUE, :entry_station, :station_history

  MIN_VALUE = 1
  MAX_VALUE = 90

  def initialize
    @balance = 0
    @entry_station = nil
    @station_history = []
  end

  def top_up(amount)
    if balance_exceeded?(amount) 
      raise "cannot exceed £#{MAX_VALUE}"
    else 
      @balance += amount
    end
  end

  def in_journey?
    @entry_station != nil
  end

  def touch_in(station)
    if @balance < MIN_VALUE
      raise "not enough funds" 
    else 
      @entry_station = station
      #@station_history.push(station)
    end
  end

  def touch_out(station)
    deduct(MIN_VALUE)
    @exit_station = station
    update_history
    @entry_station = nil
  
  end

  def update_history
    journey = { :entry_station => @entry_station, :exit_station => @exit_station }
    @station_history.push(journey)
  end

  private 

  def balance_exceeded?(amount)
    @balance + amount > MAX_VALUE
  end 

  def deduct(amount)
    @balance -= amount
  end

end