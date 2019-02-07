# require 'cust_error_location'
require 'greet/greeting'
require 'template_reader'
require 'template_assigner'
require 'deliminators'

## TemplateTool
#
# In:   several hashes for greeting, 
#       raw template to process, 
#       delimitors to parse template
#
# Out:  calls to reading & filling in template with values inputted 
#
class TemplateTool
  attr_reader :result    
  
  def initialize(args)
    args.merge!(retrieve_greeting(args))
    place_data = {raw_template: args[:raw_template] }
    place_data.merge!({ deliminator: args[:deliminator]})
    holders = retrieve_placeholders(place_data)
    @result = template_assigner(holders, args)
  end

  def retrieve_placeholders(args)
    TemplateReader.new(args).read_template
  end
  
  # Keep in mind Module::Class doesn't auto expand in ruby versus rails
  def retrieve_greeting(args)
    {timeMessage: Greet::Greeting.new(args).execute_process}
  end
  
  # returns hash of all the placeholders in @template_variables or raises error
  def template_assigner(holders, args)
    TemplateAssigner.new(holders, args).process
  end
end
