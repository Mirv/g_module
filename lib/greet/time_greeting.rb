load 'greet/time_range.rb'

class Greeting
  attr_reader :message
  
  def initialize(message, time_range)
    @message = message
    @time_range = time_range
  end
  
  # adaptor to use json format from other files
  def self.data_from_hash(h)
    message = h.fetch(:message)
    time_range = TimeRange.new(h.fetch(:start), h.fetch(:stop))
    new(message, time_range)
  end
  
  def in_effect?(hour)
    self.message if @time_range.in_range?(hour)
  end
end
