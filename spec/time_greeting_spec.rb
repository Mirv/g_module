load 'time_greeting.rb'

describe "initialized" do
  let(:greeting) { time_greet(time_inputs.dup) }

  it "should have successfully initialized" do
    # byebug
    expect(greeting).to be_truthy
  end
end

describe "template_readereader finishes" do
  # let(:greeting) { time_greet(time_inputs.dup) }
  # let(:result) {     
  #   template.read_template
  #   template.data
  # }

  # it "should add a hash of variables found to data hash" do
  #   expect(result.count).to be > 0
  # end
  
  # it "should add non-nil values to data hash" do
  #   expect(result.first).to_not be_nil
  # end
end


describe "raises errors on initialization" do
  let(:template) { time_greet(time_inputs.dup.flatten) }
  let!(:valid) { time_inputs.dup }

  it "should error if no startTimestamp key found" do
    expect{ time_greet(time_inputs.dup.reject{ |v| v == "startTimestamp"})
    }.to raise_error(ArgumentError, "startTimestamp key missing")
  end
  
  it "should error if no startTimestamp value found" do
    invalid = valid.dup
    invalid["startTimestamp"] = ""
    expect{ time_greet(invalid)
    }.to raise_error(ArgumentError, "startTimestamp was empty")
  end
  
  it "should error if startTimestamp is not valid Fixnum" do
    invalid = valid.dup
    invalid["startTimestamp"] = "asdf"
    expect{ time_greet(invalid)
    }.to raise_error(ArgumentError, "startTimestamp is not valid Fixnum")
  end

  it "should error if no timezone key found" do
    expect{ time_greet(time_inputs.dup.reject{ |v| v == "timezone"})
    }.to raise_error(ArgumentError, "timezone key missing")
  end
  
  it "should error if no timezone value found" do
    invalid = valid.dup
    invalid["timezone"] = ""
    expect{ time_greet(invalid)
    }.to raise_error(ArgumentError, "timezone was empty")
  end
  
  it "should error if timezone is not valid String" do
    invalid = valid.dup
    invalid["timezone"] = 1234
    expect{ time_greet(invalid)
    }.to raise_error(ArgumentError, "timezone is not valid String")
  end
  
  it "should error if timezone is not valid String" do
    invalid = valid.dup
    invalid["timezone"] = 1234
    expect{ time_greet(invalid)
    }.to raise_error(ArgumentError, "timezone is not valid String")
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