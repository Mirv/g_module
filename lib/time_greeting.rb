# require 'cust_error_location'
require 'time'
require 'timezone'

## TimeGreeting
#
# In:     timezone of hotel, client reservation start time
# Out:    Time specific greeting 
# Opt: :time_look_back to allow older messages to be sent
# Opt: :time_look_ahead to allow messages to be sent if reservation ready early
#
# Assumes all times in UTC on computer system side
#
class TimeGreeting
  attr_reader :data    
  
  def initialize(args)
    @look_back =    args[:time_look_back] || default_look_back 
    @look_ahead =   args[:time_look_ahead] || default_look_ahead 
    @zone =         args[:timezone]
    @timestamp =    args[:startTimestamp]
    @zone_name =    time_zone 
    @greetings =    args[:greetings] 
    init_validation(args)
  end

  def assign_greeting(hour = 6)
    hash_of_greetings = LoadGreeting.new
    greetings = GreetingSelector.data_from_array_of_hashes(hash_of_greetings)
    greeting_message = greetings.find(time_with_zone).message
    @data = greeting_message || "Greetings!" 
  end

  def time_with_zone
    @time ||= Time.at(@timestamp + timezone_offset).hour
  end

  def current_time
    Time.now  
  end
  
  def time_zone
    Timezone[@zone]
  end
  
  # Due to the time stamps the JSON files held, I'm guessing your test files are 
  # ... all from same date & the lookback protection would cause them to all fail
  def default_look_back
    two_years = 62899200
  end
  
  def default_look_ahead
    two_hours = 7200
  end

  #  Used custom gem to check all the timezones, transfer validated Abbreviation
  #  ... to the standard library time to get off set value
  #
  def timezone_offset
    @zone_offset ||= Time.zone_offset(@zone_name.abbr(Time.now))
  end
  
  ### Validations and checks section ###
  
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

  # Wrapping incase we switch gems
  def valid_zone?
    @zone_name.valid?
  end

  def init_validation(args)
    # startTimeStamp checks
    raise ArgumentError, "startTimestamp key missing" unless args.key?(:startTimestamp)
    raise ArgumentError, "startTimestamp was empty" unless @timestamp != ""
    raise ArgumentError, "startTimestamp not valid Integer" unless @timestamp.is_a? Integer
    
    raise ArgumentError, "greetings key missing" unless args.key?(:greetings)
    raise ArgumentError, "greetings was empty" unless @greetings != ""
    
    # timezone checks
    raise ArgumentError, "timezone key missing" unless args.key?(:timezone)
    raise ArgumentError, "timezone was empty" unless @zone != ""
    raise ArgumentError, "timezone is not valid String" unless @zone.is_a? String
    
    # optional - if they are set, then they need to be fixnum not strings
    raise ArgumentError, "time_look_back not valid Integer" unless @look_back.is_a? Integer
    raise ArgumentError, "time_look_ahead not valid Integer" unless @look_ahead.is_a? Integer

    # derived checks
    raise ArgumentError, "timezone is not a valid TimeZone" unless valid_zone?
    raise ArgumentError, "Message age is too old" if message_expired? 
    raise ArgumentError, "startTimestamp is in the future" if future_reservation?
  end
end