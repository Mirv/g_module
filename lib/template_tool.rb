# require 'cust_error_location'

class TemplateTool
  attr_reader :data    
  
  def initialize(args)
    @parameters = args
    @template_variables = retrieve_placeholders(args)
    # @time_greeting = retrieve_time_greeting
    @data = Hash.new
  end

  def retrieve_placeholders(args)
    args[:placeholders] || TemplateReader.new(args).read_template
  end
  
  # returns hash of all the placeholders in @template_variables or raises error
  def matched?
    @template_variables.each do |v|
      raise(KeyError) unless @parameters.fetch(v)
    end
  end

  def retrieve_time_greeting
    TimeGreeting.new(@parameters)
  end
end