# require 'cust_error_location'

class TimeGreeting
  attr_reader :data    
  
  def initialize(args)
    validate(args)

    @timezone = args["timezone"]
    @startTimestamp = args["startTimestamp"]
  end

  def zone_off

  end
  
  def validate(args)
    # startTimeStamp checks
    raise ArgumentError, "startTimestamp key missing" unless args.key?("startTimestamp")
    raise ArgumentError, "startTimestamp was empty" unless args["startTimestamp"] != ""
    raise ArgumentError, "startTimestamp is not valid Fixnum" unless args["startTimestamp"].is_a? Fixnum
    # timezone checks
    raise ArgumentError, "timezone key missing" unless args.key?("timezone")
    raise ArgumentError, "timezone was empty" unless args["timezone"] != ""
    raise ArgumentError, "timezone is not valid String" unless args["timezone"].is_a? String
  end
end