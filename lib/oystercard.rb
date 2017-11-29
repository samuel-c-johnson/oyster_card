

class OysterCard

  attr_reader :balance, :entry_station
  CARD_LIMIT = 90
  MINIMUM_BALANCE = 1
  MINIMUM_FARE = 1

  def initialize
    @balance = 0
    @entry_station = nil
  end

  def top_up(amount)
    raise 'card max of £90 exceeded' if @balance + amount > CARD_LIMIT
    @balance += amount
  end



  def touch_in(station)
    raise 'You need to touch out before starting new journey' if in_journey? == true
    raise 'Insufficient funds for travel, please top up your card' if @balance < MINIMUM_BALANCE

    @entry_station = station
  end

  def in_journey?
    @entry_station != nil
  end

  def touch_out
    raise 'You need to touch in before ending journey' if in_journey? == false
    @balance -= MINIMUM_FARE 
    @entry_station = nil

  end

end

private

def deduct(amount)
  @balance -= amount
end
