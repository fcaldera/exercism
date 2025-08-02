class Clock
  attr_reader :hour, :minute

  def initialize(hour: 0, minute: 0)
    @hour = (hour + minute / 60) % 24
    @minute = minute % 60
  end

  def to_s
    "#{@hour.to_s.rjust(2, "0")}:#{@minute.to_s.rjust(2,"0")}"
  end

  def +(clock)
    Clock.new(hour: @hour + clock.hour, minute: @minute + clock.minute)
  end

   def -(clock)
    Clock.new(hour: @hour - clock.hour, minute: @minute - clock.minute)
  end

  def ==(clock)
    @hour == clock.hour && @minute == clock.minute
  end
end