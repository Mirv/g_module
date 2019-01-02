## TimeRange 
#
# In:   2 integers of hours between 0 & 24
# Out:  in_range returns true if it finds another param between the values of range
#
class TimeRange

  def initialize(start, stop)
    @max_hours = 24
    @min_hours = 0
    @start = start
    @stop = stop
  end
  
  def complete?
    @start && @stop
  end
  
  def is_hour?(target)
    (@min_hours..@max_hours).cover?(target)  
  end
  
  def validated?
    complete? && is_hour?(@start) && is_hour?(@stop)
  end

  def in_range?(hour)
    return false unless validated?
    (@start..@stop).cover?(hour)
  end
end
