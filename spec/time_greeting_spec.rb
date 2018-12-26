load 'time_greeting.rb'

describe "initialized" do
  let(:greeting) { time_greet(time_inputs.dup) }

  it "should have successfully initialized" do
    expect(greeting).to be_truthy
  end
end



describe "raises errors on initialization" do
  let(:template) { time_greet(time_inputs.dup.flatten) }
  let!(:valid) { time_inputs.dup }

  it "should error if no startTimestamp key found" do
    expect{ time_greet(valid.reject{ |v| v == "startTimestamp"})
    }.to raise_error(ArgumentError, "startTimestamp key missing")
  end
  
  it "should error if no startTimestamp value found" do
    valid["startTimestamp"] = ""
    expect{ time_greet(valid)
    }.to raise_error(ArgumentError, "startTimestamp was empty")
  end
  
  it "should error if startTimestamp is not valid Integer" do
    valid["startTimestamp"] = "asdf"
    expect{ time_greet(valid)
    }.to raise_error(ArgumentError, "startTimestamp not valid Integer")
  end

  it "should error if the startTimestamp is in the future" do
    valid["startTimestamp"] = Time.now.to_i + 1344123412234
    expect{time_greet(valid)
    }.to raise_error(ArgumentError, "startTimestamp is in the future")
  end
  
  it "should error if the startTimestamp is too long ago" do
    three_years = 94348800
    valid["startTimestamp"] = (Time.now.to_i - three_years)
    expect{time_greet(valid)
    }.to raise_error(ArgumentError, "Message age is too old")
  end

  it "should error if no timezone key found" do
    expect{ time_greet(valid.reject{ |v| v == "timezone"})
    }.to raise_error(ArgumentError, "timezone key missing")
  end
  
  it "should error if no timezone value found" do
    valid["timezone"] = ""
    expect{ time_greet(valid)
    }.to raise_error(ArgumentError, "timezone was empty")
  end
  
  it "should error if timezone is not valid String" do
    valid["timezone"] = 1234
    expect{ time_greet(valid)
    }.to raise_error(ArgumentError, "timezone is not valid String")
  end
  
  it "should error if timezone is not valid String" do
    valid["timezone"] = 1234
    expect{ time_greet(valid)
    }.to raise_error(ArgumentError, "timezone is not valid String")
  end
  
  it "should error if timezone is not valid TimeZone" do
    valid["timezone"] = 'America/Minneapolis'
    expect{ time_greet(valid)
    }.to raise_error(ArgumentError, "timezone is not a valid TimeZone")
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
end

def time_inputs
  {
    "startTimestamp" => 1486654792,
    "timezone" => "US/Central"
  }
end

def time_greet(values)
  TimeGreeting.new(values)
end