load 'assemble_loaders.rb'

class GreetingSystem
  attr_reader :greeting_message, :data
  
  def initialize(**args)
    # generic non-explicit args list for flexibilty
    
    # Explicit pre checks 
    # pre lookup checks - as "" as value in hash is not valid, incorrectly
    raise ArgumentError, "First Name was empty" if args[:first].empty?
    raise ArgumentError, "Last Name was empty" if args[:last].empty?
    raise ArgumentError, "Company Name was empty" if args[:company].empty?
    raise ArgumentError, "Template Name was empty" if args[:template].empty?
    
    @names = args
    @data = Hash.new
  end

  ## assembly_loader
  #
  # In:  @names array
  # Out: hash exposed via data of user's specific data set
  def assemble_loaders(**args)
    loaders = AssembleLoaders.new(names)
    @data = loaders.data
  end
  
  
  # dynamically finds the calling method name & file
  def err_location(msg = "")
    location = "#{caller_name} in #{__FILE__}"
    file_error = "#{msg} in #{location}"
  end
  
  def caller_name
    caller[0][/`([^']*)'/, 1]
  end
  
end



  ## Setter_decoupler (duck-type caller)
  # - '#load' should oads all the data to be used based on user input
  #   Currently: 
  #     guest (first/last/room/time)
  #     company (hotel, city for timezone)
  #     template (format to output)
  # - Each class extending FileLoad has it's own default file string
  # - Each object should expose a data var to save into G.S obj
  #
  # def setter_decoupler(objects)
    
  #   object

  # end
  
  # def arg_err