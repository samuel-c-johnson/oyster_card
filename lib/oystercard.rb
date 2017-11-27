

class OysterCard

  attr_reader :balance
  CARD_LIMIT = 90

  def initialize
    @balance = 0
    @in_journey = false
  end

  def top_up(amount)
    raise 'card max of £90 exceeded' if @balance + amount > CARD_LIMIT
    @balance += amount
  end

  def deduct(amount)
    @balance -= amount
  end

  def touch_in
    raise 'You need to touch out before starting new journey' if @in_journey == true
    @in_journey = true
  end

  def in_journey?
    @in_journey
  end

  def touch_out
    raise 'You need to touch in before ending journey' if @in_journey == false 
    @in_journey = false
  end

end
