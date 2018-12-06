require 'json'
load 'load_guest.rb'

class GreetingSystem
  attr_reader :greeting_message
  
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
    # Begin deriving values from external sources
    @reservation = set_reservation(@names[:directory]) 

  end
  
  def set_reservation(directory)
    LoadGuest.new(
      @names[:first], 
      @names[:last], 
      directory) unless directory.nil?
  end
  
  ## Setter_decoupler
  # Loads all the data to be used based on user input
  #   Currently: 
  #     guest (first/last/room/time)
  #     company (hotel, city for timezone)
  #     template (format to output)
  # Each class extending FileLoad has it's own default file string
  def setter_decoupler(objects)
    
    object.load
    rescue
    
  end
end