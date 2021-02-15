MINUTES_PER_HOUR = 60
HOURS_PER_DAY = 24
MINUTES_PER_DAY = MINUTES_PER_HOUR * HOURS_PER_DAY

class ClockSpec

  attr_reader :hours, :minutes, :time_str_in_minutes

  def initialize(time_str_in_minutes)
    # puts time_str_in_minutes
    @time_str_in_minutes = time_str_in_minutes
  end

  def +(operand)
    ClockSpec.new(@time_str_in_minutes + operand)
  end

  def -(operand)
    ClockSpec.new(@time_str_in_minutes - operand)
  end

  def ==(other)
    # @time_str_in_minutes == other.time_str_in_minutes
    self.to_s == other.to_s
  end

  def to_s
    @time_str_in_minutes = @time_str_in_minutes % MINUTES_PER_DAY
    hours, minutes = @time_str_in_minutes.divmod(MINUTES_PER_HOUR)
    out_str = format('%02d:%02d', hours.to_s, minutes.to_s)
  end

end

class Clock
  # Must output a ClockSpec class, with time in minutes initialized
  def self.at(hour, min=0)
    ClockSpec.new(hour * MINUTES_PER_HOUR + min)
  end
end

# puts Clock.at(8)
