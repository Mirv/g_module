# require 'cust_error_location'

class TemplateTool
  attr_reader :data    
  
  def initialize(args)
    @parameters = args
    @template_variables = matched?(retrieve_placeholders(args))
    @data = Hash.new
  end

  def retrieve_placeholders(args)
    args[:placeholders] || TemplateReader.new(args).read_template
  end
  
  # returns hash of all the placeholders or raises error
  def matched?(hash)
    hash.each do |v|
      raise(KeyError) unless @parameters.fetch(v)
    end
  end

  def humanized_time
    # Turn time serial into time
    # Stick it thru utc adjustment based on timezone
    # Time.at(tt)
    # utc_offset
  end
end