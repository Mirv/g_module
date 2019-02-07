load 'greet/hour.rb'

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
    expect{ time_greet(valid.reject{ |v| v == :startTimestamp})
    }.to raise_error(ArgumentError, "startTimestamp key missing")
  end
  
  it "should error if no startTimestamp value found" do
    valid[:startTimestamp] = ""
    expect{ time_greet(valid)
    }.to raise_error(ArgumentError, "startTimestamp was empty")
  end
  
  it "should error if startTimestamp is not valid Integer" do
    valid[:startTimestamp] = "asdf"
    expect{ time_greet(valid)
    }.to raise_error(ArgumentError, "startTimestamp not valid Integer")
  end


  it "should error if no timezone key found" do
    error = ArgumentError.new("timezone missing")
    expect{ time_greet(valid.reject{ |v| v == :timezone}).to_s
    }.to raise_error(error.to_s)
  end
end

def time_inputs
  {
    :startTimestamp => 1486654792,
    :timezone => "US/Central",
  }
end

def time_greet(values)
  Greet::Hour.new(values)
end