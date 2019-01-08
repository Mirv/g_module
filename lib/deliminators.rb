class Deliminators
  attr_reader :start, :stop
  
  def initialize(start, stop)
    @start = start 
    @stop = stop 
    raise ArgumentError, "Deliminator start was empty" unless @start
    raise ArgumentError, "Deliminator stop was empty" unless @stop 
  end
end