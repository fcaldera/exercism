class AssemblyLine
  MIN_SPEED = 221
  
  def initialize(speed)
    @speed = speed

    if @speed >= 1 && @speed <= 4
      @success_rate = 1.0
    elsif @speed >= 5 && @speed <= 8
      @success_rate = 0.9
    elsif @speed == 9 
      @success_rate = 0.8 
    elsif @speed == 10
      @success_rate = 0.77
    end
  end

  def production_rate_per_hour
    @speed * MIN_SPEED * @success_rate
  end

  def working_items_per_minute
    (production_rate_per_hour / 60).floor.to_i
  end
end
