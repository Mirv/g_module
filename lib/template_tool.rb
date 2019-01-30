# require 'cust_error_location'
load 'greet/greeting.rb'
load 'template_reader.rb'
load 'template_assigner.rb'
load 'deliminators.rb'

class TemplateTool
  attr_reader :result    
  
  def initialize(args)
    # byebug
    args.merge!(retrieve_greeting(args))
    place_data = {raw_template: args[:raw_template] }
    place_data.merge!({ deliminator: args[:deliminator]})
    holders = retrieve_placeholders(place_data)
    @result = template_assigner(holders, args)
  end

  def retrieve_placeholders(args)
    TemplateReader.new(args).read_template
  end
  
  def retrieve_greeting(args)
    {timeMessage: Greet::Greeting.new(args).execute_process}
  end
  
  # returns hash of all the placeholders in @template_variables or raises error
  def template_assigner(holders, args)
    TemplateAssigner.new(holders, args).process
  end
end
