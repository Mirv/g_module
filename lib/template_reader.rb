# require 'cust_error_location'

## TemplateReader
#
# In:   hash holding string of template, deliminators 
# Out:  array of unique variable names found within deliminators
#
class TemplateReader
  attr_reader :result    
  
  def initialize(args)
    validate(args)
    @raw_template = args[:raw_template]
    @start =        args[:deliminator].start
    @stop =         args[:deliminator].stop
    # @start = args.dig(:deliminator, :start)
    # @stop = args.dig(:deliminator, :stop)
  end
  
  def read_template
    pull = @raw_template.scan(/#{@start}(.*?)#{@stop}/).flatten.uniq
    raise ArgumentError, "No placeholders found in template" if pull.empty?
    return @result = pull
  end
  
  def validate(args)
    raise ArgumentError, "Deliminator hash was empty" unless args.key?(:deliminator)
    raise ArgumentError, "raw_template key was missing" unless args.key?(:raw_template)
    raise ArgumentError, "raw_template string was empty" if args[:raw_template].empty?
  end
end