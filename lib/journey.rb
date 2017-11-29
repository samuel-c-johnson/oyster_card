class Journey
  attr_reader :start_point, :end_point

  def initialize
    @complete = false
  end

  def start(station)
    @start_point = station.name
  end

  def finish(station)
    @end_point = station.name
    @complete = true
  end


  def fare
  end

  def complete?
    @complete
  end

end
