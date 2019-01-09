# require 'cust_error_location'
load 'greet/time_to_greeting.rb'
load 'template_reader.rb'
load 'template_assigner.rb'
load 'deliminators.rb'

class TemplateTool
  attr_reader :data    
  
  def initialize(args)
    @parameters =   args
    @parameters.merge!(retrieve_greeting(args))
    holders =       retrieve_placeholders(args)
    @data =         template_assigner(holders, args)
  end

  def retrieve_placeholders(args)
    args[:placeholders] || TemplateReader.new(args).read_template
  end
  
  def retrieve_greeting(args)
    {timeGreeting: TimeToGreeting.new(args).execute_process}
  end
  
  # returns hash of all the placeholders in @template_variables or raises error
  def template_assigner(holders, args)
    TemplateAssigner.new(holders, args).data
  end
end
