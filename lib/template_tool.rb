# require 'cust_error_location'

class TemplateTool
  attr_reader :data    
  
  def initialize(args)
    @parameters = args
    @template_variables ||= TemplateReader.new(args).read_template
    @data = Hash.new
  end
  
  def humanized_time
    # Turn time serial into time
    # Stick it thru utc adjustment based on timezone
    # Time.at(tt)
    # utc_offset
  end
end