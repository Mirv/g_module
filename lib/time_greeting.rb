# require 'cust_error_location'

class TimeGreeting
  attr_reader :data    
  
  def initialize(args)
    @raw_template = args[:raw_template]
  end
  
  def read_template
    pull = @raw_template.scan(/\{(.*?)\}/).flatten.uniq
    @data = pull
  end
end