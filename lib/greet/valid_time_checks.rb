    # prevent old messages from replaying
    # Manipulate via :time_look_back in hash when initlializing in case of outtage
    # current time minus the grace period > reservation time, it's stale, so return true 
    #
    def message_expired?
      @look_back > @timestamp.to_i + @zone_offset
    end
    
    # if reservation is ready too soon its likely some sort of error
    def future_reservation?
      @timestamp.to_i + @zone_offset > current_time.to_i + @look_ahead
    end
    
    # optional - if they are set, then they need to be fixnum not strings
      # TOOD - write generic test for instance variables & is integer that's shorter 
      raise ArgumentError, 
        "time_look_back not valid Integer" unless @look_back.is_a? Integer
      raise ArgumentError, 
        "time_look_ahead not valid Integer" unless @look_ahead.is_a? Integer
    end
    
    def computed_values_validation(args)
      # derived checks
      raise ArgumentError, "Message age is too old" if message_expired? 
      raise ArgumentError, "startTimestamp is in the future" if future_reservation?
    end