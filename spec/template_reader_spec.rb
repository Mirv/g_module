require 'template_reader.rb'

describe "initialized" do
  let(:template) { template_reader(valid_template_inputs.dup) }

  it "should have successfully initialized" do
    expect(template).to be_truthy
  end
end

describe "template_readereader finishes" do
  let(:template) { template_reader(valid_template_inputs.dup) }
  let(:result) {     
    template.read_template
    template.result
  }

  it "should add a hash of variables found to data hash" do
    expect(result.count).to be > 0
  end

  it "should add non-nil values to data hash" do
    expect(result.first).to_not be_nil
  end
end

describe "returns errors when starting" do
  let(:template) { template_reader(valid_template_inputs.dup) }
  let!(:valid) { valid_template_inputs.dup }

  it "should error if no raw_template key found" do
    expect{ template_reader(valid.reject{ |v| v == :raw_template})
    }.to raise_error(ArgumentError, "raw_template key was missing")
  end
  
  it "should error if no raw_template value found" do
    valid[:raw_template] = ""
    expect{ template_reader(valid)
    }.to raise_error(ArgumentError, "raw_template string was empty")
  end
  
  it "should error if no deliminator key found" do
    expect{ template_reader(valid.reject{ |v| v == :deliminator})
    }.to raise_error(ArgumentError, "Deliminator hash was empty")
  end
  
  it "should raise error if no placeholders found" do
    invalid_raw = valid_template_inputs.dup
    invalid_raw[:raw_template]  =  "blah" 
    expect{template_reader(invalid_raw).read_template
    }.to raise_error(ArgumentError, "No placeholders found in template")
  end
end

def valid_template_inputs
  {
    :raw_template=>"{timeMessage} {firstName} {lastName}. Room number {roomNumber} is now available for your use at {company} in {city}.  If you require anything please reach out to us.", 
    :deliminator=> Deliminators.new('{','}')
  }
end

def template_reader(values)
  TemplateReader.new(values)
end