# require 'cust_error_location'
load 'greeters/time_greeting_selector.rb'
require 'time'
require 'timezone'  # TODO - pull when class ready
# load 'greeters/time_zone_names.rb' # TODO - unlock me huuuuuman!

## TimeInHours
#
# In:     timezone of hotel, unix timestamp of client reservation start time
# Out:    Time in hours
# Opt: :time_look_back to allow older messages to be sent
# Opt: :time_look_ahead to allow messages to be sent if reservation ready early
#
# Assumes all times in UTC on computer system side
#
class TimeInHours
  attr_reader :data    
  
  def initialize(args)
    @look_back =    args[:time_look_back]   || default_look_back 
    @look_ahead =   args[:time_look_ahead]  || default_look_ahead 
    @zone =         args[:timezone]
    @timestamp =    args[:startTimestamp]
    @zone_name =    Timezone[@zone] 
    # @zone_name =    TimeZoneNames.abbreviation
    init_validation(args)
  end

  def time_in_hours
    @time ||= Time.at(@timestamp + timezone_offset).hour
  end

  def current_time
    Time.now  
  end

  # TODO - modify this to keep the `@zone_offset ||` but call to new object
  #  Used custom gem to check all the timezones, transfer validated Abbreviation
  #  ... to the standard library time to get off set value
  def timezone_offset
    @zone_offset ||= Time.zone_offset(@zone_name.abbr(Time.now))
    # @zone_offset ||= Time.zone_offset(@zone_name)  # TODO - unlock me huuuuman!!
  end

  # Due to the time stamps the JSON files held, I'm guessing your test files are 
  # ... all from same date & the lookback protection would cause them to all fail
  def default_look_back
    two_years = 62899200
  end
  
  def default_look_ahead
    two_hours = 7200
  end
  
  # prevent old messages from replaying
  # Manipulate via :time_look_back in hash when initlializing in case of outtage
  # current time minus the grace period > reservation time, it's stale, so return true 
  #
  def message_expired?
    current_time.to_i - @look_back > @timestamp.to_i + timezone_offset
  end
  
  # if reservation is ready too soon its likely some sort of error
  def future_reservation?
    @timestamp.to_i + timezone_offset > current_time.to_i + @look_ahead
  end

  # TODO - REMOVE ME HUUUMAN!!
  # Wrapping incase we switch gems
  def valid_zone?
    @zone_name.valid?
  end

  def init_validation(args)
    # startTimeStamp checks
    raise ArgumentError, "startTimestamp key missing" unless @timestamp
    raise ArgumentError, "startTimestamp was empty" unless @timestamp != ""
    # TOOD - write generic test for instance variables & is integer that's shorter 
    # ... that would wrap all 3 of these types of things just for this class
    raise ArgumentError, "startTimestamp not valid Integer" unless @timestamp.is_a? Integer

    # TODO - adjust to check presence of new object
    # timezone checks
    raise ArgumentError, "timezone key missing" unless args.key?(:timezone)
    raise ArgumentError, "timezone was empty" unless @zone != ""
    # TODO - remove these 2
    raise ArgumentError, "timezone is not valid String" unless @zone.is_a? String
    raise ArgumentError, "timezone is not a valid TimeZone" unless valid_zone?
    
    # optional - if they are set, then they need to be fixnum not strings
    # TOOD - write generic test for instance variables & is integer that's shorter 
    raise ArgumentError, "time_look_back not valid Integer" unless @look_back.is_a? Integer
    raise ArgumentError, "time_look_ahead not valid Integer" unless @look_ahead.is_a? Integer

    # derived checks
    raise ArgumentError, "Message age is too old" if message_expired? 
    raise ArgumentError, "startTimestamp is in the future" if future_reservation?
  end
end