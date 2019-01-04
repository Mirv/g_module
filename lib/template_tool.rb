# require 'cust_error_location'
load 'greeters/time_to_greeting.rb'
load 'template_reader.rb'

class TemplateTool
  attr_reader :data    
  
  def initialize(args)
    @parameters = args
    @template_variables = retrieve_placeholders(args)
    @greetings = retrieve_greeting(args)
    @data = Hash.new
  end

  def retrieve_placeholders(args)
    args[:placeholders] || TemplateReader.new(args).read_template
  end
  
  def retrieve_greeting(args)
    @data = TimeToGreeting.new(args).execute_process
  end
  
  # returns hash of all the placeholders in @template_variables or raises error
  def matched?
    @template_variables.each do |v|
      raise(KeyError) unless @parameters.fetch(v)
    end
  end
end