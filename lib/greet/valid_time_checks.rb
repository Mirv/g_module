# File grave yard - likely YAGTNI


      @look_back =    args[:time_look_back]   || default_look_back 
      @look_ahead =   args[:time_look_ahead]  || default_look_ahead 

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
    
    # Due to the time stamps the JSON files held, I'm guessing your test files are 
    # ... all from same date & the lookback protection would cause them to all fail
    def default_look_back
      two_years = 62899200
    end
    
    def default_look_ahead
      two_hours = 7200
    end
    
    
      it "should error if the startTimestamp is in the future" do
    valid[:startTimestamp] = Time.now.to_i + 1344123412234
    expect{time_greet(valid)
    }.to raise_error(ArgumentError, "startTimestamp is in the future")
  end
  
  it "should error if the startTimestamp is too long ago" do
    three_years = 94348800
    valid[:startTimestamp] = (Time.now.to_i - three_years)
    expect{time_greet(valid)
    }.to raise_error(ArgumentError, "Message age is too old")
  end
  
    it "should error if time_look_back is not valid Integer" do
    valid[:time_look_back] = "asdf"
    expect{ time_greet(valid)
    }.to raise_error(ArgumentError, "time_look_back not valid Integer")
  end
  
  it "should error if time_look_ahead is not valid Integer" do
    valid[:time_look_ahead] = "asdf"
    expect{ time_greet(valid)
    }.to raise_error(ArgumentError, "time_look_ahead not valid Integer")
  end
  
  