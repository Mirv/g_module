load 'template_tool.rb'

describe "template initialized" do
  let(:template) { templater(inputs.dup) }
  context "successfully initialized" do

    it "should have a working object" do
      expect(template).to be_truthy
    end
    
    it "should retrieve a non-default greeting" do
      expect(template.retrieve_greeting(inputs.dup)).to_not eq("Greetings")
    end
  end
  
  context "given there are issues" do
    it "should error if any placeholders have no replacement in template" do
      bad = inputs.dup
      bad[:placeholders] = {missing: "Will not be found"}
      expect{ templater(bad).matched? }.to raise_error(KeyError)
    end
  end

  let(:inputs){
    {
      # mandatory input
      directory: 'lib/data', # tests for rspec don't include subdirs 
      firstName: "Candy", 
      lastName: "Pace", 
      template: "Default",  
      
      # reservation data
      roomNumber: 529, 
      startTimestamp: 1486654792, 
      endTimestamp: 1486852373, 
      
      # template data
      raw_template: "{timeGreeting} {firstName} {lastName}. Room number {roomNumber} is now available for your use at {company} in {city}.  If you require anything please reach out to us.", 
      deliminator: {start: "{", stop: "}" }, 
      
      # company data
      id: 1, 
      company: "Hotel California", 
      city: "Santa Barbara", 
      timezone: "US/Pacific"
    }
  }
end

def templater(values)
  TemplateTool.new(values)
end