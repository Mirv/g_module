load 'cust_error_location.rb'
load 'assemble_loaders.rb'

class GreetingSystem
  attr_reader :greeting_message, :names, :data
  
  def initialize(**args)
    # generic non-explicit args list for flexibilty
    
    # Explicit pre checks 
    # pre lookup checks - as "" as value in hash is not valid, incorrectly
    raise ArgumentError, "First Name was empty"     if args[:firstName].nil? || args[:firstName].empty?
    raise ArgumentError, "Last Name was empty"      if args[:lastName].nil? || args[:lastName].empty?
    raise ArgumentError, "Company Name was empty"   if args[:company].nil? || args[:company].empty?  
    raise ArgumentError, "Template Name was empty"  if args[:template].nil? ||args[:template].empty?
    
    @names = args
    @data = Hash.new
  end

  ## assemble_loaders
  #
  # In:  @names hash
  # Out: hash exposed via data of user's specific data set
  def assemble_loaders
    loaders =   AssembleLoaders.new(@names)
    loaders.process_loaders
    @names.merge!(loaders.data)
  end
  
  
  ## template object
  #
  # In:  @data hash of 
  ## template_reader
  #
  # In:  template as string
  # Out: array of variables to replace
  
  ## template_computations
  #
  # In:           array of variables
  # Side effects: call methods to compute variables if flagged as matching hash
  # Out:          array of computed values in hash keys
  
  ## tempalte_parser
  #
  # In:   hash with template & variables
  # Out:  string with all values substituted into it
  
end

