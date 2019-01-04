# require 'cust_error_location'

## TemplateReader
#
# In:   hash holding string of template, deliminators 
# Out:  array of unique variable names found within deliminators
#
class TemplateReader
  attr_reader :data    
  
  def initialize(args)
    validate(args)
    @raw_template = args[:raw_template]
    @start =        args[:deliminator][:start]
    @stop =         args[:deliminator][:stop]
  end
  
  def read_template
    pull = @raw_template.scan(/#{@start}(.*?)#{@stop}/).flatten.uniq
    raise ArgumentError, "No placeholders found in template" if pull.empty?
    return @data = pull
  end
  
  def validate(args)
    raise ArgumentError, "Deliminator hash was empty" unless args.key?(:deliminator)
    raise ArgumentError, "Deliminator start was empty" unless args[:deliminator][:start]
    raise ArgumentError, "Deliminator stop was empty" unless args[:deliminator][:stop]
    raise ArgumentError, "raw_template key was missing" unless args.key?(:raw_template)
    raise ArgumentError, "raw_template string was empty" if args[:raw_template].empty?
  end
end