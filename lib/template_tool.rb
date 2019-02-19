# require 'cust_error_location'
require_relative 'greet/greeting'
require_relative 'template_assigner'
require_relative 'loaders/load_template'

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
    @dir = args[:directory] || 'data'
    holders = retrieve_placeholders
    @result = template_assigner(holders, args)
  end

  def retrieve_placeholders
    @template = LoadTemplate.new(directory: @dir, template: 'Bond Style')
    @template.execute_process  
    @template = @template.result
  end
  
  # Keep in mind Module::Class doesn't auto extrapolate if adding in ruby versus rails
  def retrieve_greeting(args)
    {timeMessage: Greet::Greeting.new(args).execute_process}
  end
  
  # returns hash of all the placeholders in @template_variables or raises error
  def template_assigner(holders, args)
    TemplateAssigner.new(holders, args).process
  end
end
