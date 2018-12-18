# require 'cust_error_location'
require 'timezone'

class TimeGreeting
  attr_reader :data    
  
  def initialize(args)
    validate(args)

    @timezone = args["timezone"]
    @startTimestamp = args["startTimestamp"]
    @zone = Timezone[@timezone] 
  end

  def adjust_timezone
    Timezone[@timezone] if @zone_valid
  end

  # Wrapping incase we switch gems
  def valid_zone?(zone)
    Timezone[zone].valid?
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
    raise ArgumentError, "timezone is not valid TimeZone" unless valid_zone? args["timezone"]
  end
end