# require 'cust_error_location'

class TemplateReader
  attr_reader :data    
  
  def initialize(args)
    @raw_template = args[:raw_template]
    @data = Hash.new
  end
  
  def read_template
    pull = @raw_template.scan(/\{(.*?)\}/).flatten.uniq
    @data.merge!({template_variables: pull})
  end
end