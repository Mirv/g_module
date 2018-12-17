# require 'cust_error_location'

class TemplateTool
  attr_reader :data    
  
  # def initialize(**args)
  def initialize(args)

    # byebug
    validate(args)
    
    # "test" unless @delims = args[:deliminator]
    
    @raw_template = args[:raw_template]
    @data = Hash.new
  end
  
  def read_template
    pull = @raw_template.scan(/\{(.*?)\}/).flatten.uniq
    @data.merge!({template_variables: pull})
  end
  
  def validate(args)
    raise ArgumentError, "Deliminator hash was empty" unless args.key?(:deliminator)
    raise ArgumentError, "Deliminator start was empty" unless args[:deliminator]['start']
    raise ArgumentError, "Deliminator stop was empty" unless args[:deliminator]['stop']
    raise ArgumentError, "raw_template key was missing" unless args.key?(:raw_template)
    raise ArgumentError, "raw_template string was empty" if args[:raw_template].empty?
  end
  
end