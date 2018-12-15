load 'cust_error_location.rb'
load 'assemble_loaders.rb'

class GreetingSystem
  attr_reader :greeting_message
  
  def initialize(**args)
    # generic non-explicit args list for flexibilty
    
    # Explicit pre checks 
    # pre lookup checks - as "" as value in hash is not valid, incorrectly
    raise ArgumentError, "First Name was empty"     if args[:firstName].empty?
    raise ArgumentError, "Last Name was empty"      if args[:lastName].empty?
    raise ArgumentError, "Company Name was empty"   if args[:company].empty?
    raise ArgumentError, "Template Name was empty"  if args[:template].empty?
    
    @names = args
    @data = Hash.new
  end

  ## assembly_loader
  #
  # In:  @names array
  # Out: hash exposed via data of user's specific data set
  def assemble_loaders(**args)
    loaders =   AssembleLoaders.new(@names)
    @data =     loaders.data
  end
  
  
end

