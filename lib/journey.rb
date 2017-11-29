require_relative 'station'

class Journey
  attr_reader :start_point, :end_point

  MINIMUM_FARE = 1
  PENALTY_FARE = 45


  def start(station)
    @start_point = station.name
    @complete = try_to_complete_journey
  end

  def finish(station)
    @end_point = station.name
    @complete = try_to_complete_journey
  end

  def try_to_complete_journey
    @start_point != nil && @end_point != nil

  end

  def fare
    complete? ? MINIMUM_FARE : PENALTY_FARE
  end

  def complete?
    @complete
  end

end
