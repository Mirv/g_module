require 'json'
load 'load_guest.rb'

class GreetingSystem
  attr_reader :greeting_message
  
  def initialize(**args)
    # pre lookup checks - as "" is not valid, need to check `empty`
    raise ArgumentError, "First Name was empty" if args[:first].empty?
    raise ArgumentError, "Last Name was empty" if args[:last].empty?
    raise ArgumentError, "Company Name was empty" if args[:company].empty?
    raise ArgumentError, "Template Name was empty" if args[:template].empty?
    
    @names = args
  
    # Begin deriving values from external sources
    @reservation = set_reservation
    @room = set_room
    @time = set_timestamp
  end
  
  def set_reservation
    LoadGuest.new(@names[:first], @names[:last], 'lib/data').reservation
  end
  
  def set_room
    @reservation["roomNumber"]
  end

  def set_timestamp
    @reservation['startTimestamp']
  end
end