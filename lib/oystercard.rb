

class OysterCard

  attr_reader :balance
  CARD_LIMIT = 90
  MINIMUM_BALANCE = 1
  MINIMUM_FARE = 1

  def initialize
    @balance = 0
    @in_journey = false
  end

  def top_up(amount)
    raise 'card max of £90 exceeded' if @balance + amount > CARD_LIMIT
    @balance += amount
  end



  def touch_in
    raise 'You need to touch out before starting new journey' if @in_journey == true
    raise 'Insufficient funds for travel, please top up your card' if @balance < MINIMUM_BALANCE
    @in_journey = true
  end

  def in_journey?
    @in_journey
  end

  def touch_out
    raise 'You need to touch in before ending journey' if @in_journey == false
    @balance -= MINIMUM_FARE
    @in_journey = false
  end

end

private

def deduct(amount)
  @balance -= amount
end
