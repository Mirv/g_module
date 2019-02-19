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
    
    ### TODO - pull
    # place_data = {raw_template: args[:template] }
    # place_data.merge!({ deliminator: args[:deliminator]})
    ###
    
    ## TODO - moved this into retrieve_placeholders - remove later
    # @template = LoadTemplate.new(directory: 'lib/data', template: 'Bond Style')
    # @template.execute_process
    # @template = @template.result
    ### 
    
    holders = retrieve_placeholders
    @result = template_assigner(holders, args)
  end

  def retrieve_placeholders
    @template = LoadTemplate.new(directory: 'data', template: 'Bond Style')
    @template.execute_process  # not even a thing? Not tested? TODO
    @template = @template.result[:template]
  end
  
  # Keep in mind Module::Class doesn't auto extrapolate if adding in ruby versus rails
  def retrieve_greeting(args)
    {timeMessage: Greet::Greeting.new(args).execute_process}
  end
  
  # returns hash of all the placeholders in @template_variables or raises error
  def template_assigner(holders, args)
    # puts args
    TemplateAssigner.new(holders, args).process
  end
end
