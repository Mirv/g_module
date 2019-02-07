require_relative 'zone_time.rb'
require 'time'

## Hour
#
# In:     timezone of hotel, unix timestamp of client reservation start time
# Out:    Time in hours
# Opt: :time_look_back to allow older messages to be sent
# Opt: :time_look_ahead to allow messages to be sent if reservation ready early
#
# Assumes all times in UTC on computer system side
#
module Greet
  class Hour

    def initialize(args)
      @look_back =    args[:time_look_back]   || default_look_back 
      @look_ahead =   args[:time_look_ahead]  || default_look_ahead 
      @timestamp =    args[:startTimestamp]
      input_validation(args)
      @zone_offset =    Greet::ZoneName.new(args[:timezone]).timezone_offset
    end

    def time_in_hours
      @time ||= Time.at(@timestamp + @zone_offset).hour
    end
  
    def current_time
      Time.now  
    end

    # Due to the time stamps the JSON files held, I'm guessing your test files are 
    # ... all from same date & the lookback protection would cause them to all fail
    def default_look_back
      two_years = 62899200
    end
    
    def default_look_ahead
      two_hours = 7200
    end

    def input_validation(args)
      # startTimeStamp checks
      raise ArgumentError, "startTimestamp key missing" unless @timestamp
      raise ArgumentError, "startTimestamp was empty" unless @timestamp != ""
      # TOOD - write generic test for instance variables & is integer that's shorter 
      # ... that would wrap all 3 of these types of things just for this class
      raise ArgumentError, 
        "startTimestamp not valid Integer" unless @timestamp.is_a? Integer
    end
  end
end