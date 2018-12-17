load 'template_tool.rb'

describe "initialized" do
  let(:template) { templater(valid_template_inputs.dup) }

  it "should have successfully initialized" do
    expect(template).to be_truthy
  end
end

describe "returns errors when starting" do
  let(:template) { templater(valid_template_inputs.dup) }
  let!(:valid) { valid_template_inputs.dup }

  it "should error if no raw_template key found" do
    expect{ templater(valid.reject{ |v| v == :raw_template})
    }.to raise_error(ArgumentError, "raw_template key was missing")
  end
  
  it "should error if no raw_template value found" do
    valid[:raw_template] = ""
    expect{ templater(valid)
    }.to raise_error(ArgumentError, "raw_template string was empty")
  end
  
  it "should error if no deliminator key found" do
    expect{ templater(valid.reject{ |v| v == :deliminator})
    }.to raise_error(ArgumentError, "Deliminator hash was empty")
  end
  
  it "should error if no start deliminator found" do
    valid[:deliminator]['start'] = nil
    expect{ templater(valid)
    }.to raise_error(ArgumentError, "Deliminator start was empty")
  end
  
  it "should error if no stop deliminator found" do
    valid[:deliminator]['stop'] = nil
    expect{ templater(valid)
    }.to raise_error(ArgumentError, "Deliminator stop was empty")
  end
end

# describe "finishes running" do
#   let(:template) { templater(valid_template_inputs.dup) }
#   let(:result) {     
#     template.read_template
#     template.template_variables
#   }

#   it "should add a hash of variables found to :template_variables data hash" do
#     expect(result).to have_key(:firstName)
#   end
  
#   it "should add a hash of variables found to :template_variables data hash" do
#     expect(result).to include('timeGreeting')
#   end
# end

def valid_template_inputs
  {
    firstName: "Candy", lastName: "Pace", template: "Default", 
    company: "The Grand Budapest Hotel", directory: "lib/data",
    "roomNumber"=>529, "startTimestamp"=>1486654792, "endTimestamp"=>1486852373, 
    :raw_template=>"{timeGreeting} {firstName} {lastName}. Room number {roomNumber} is now available for your use at {company} in {city}.  If you require anything please reach out to us.", 
    :deliminator=>{"start"=>"{", "stop"=>"}"}, 
    "id"=>1, "company"=>"Hotel California", "city"=>"Santa Barbara", "timezone"=>"US/Pacific"
  }
end

def templater(values)
  TemplateTool.new(values)
end