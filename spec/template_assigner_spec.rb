require 'template_assigner.rb'
require 'test_constants.rb'

describe "Assigner" do 
  let(:assigner){
    TemplateAssigner.new(holders, inputs).process
  }
  
  context "loads successfully" do
    it "should create object" do
      expect(assigner).to be_truthy
    end
    
    it "should load hashes to be parsed to template" do
      expect{assigner}.to_not raise_error 
    end
    
    it "should generate a message" do
      msg = "Good Morning Candy Pace. Room number 529 is now available for " \
      "your use at Hotel California in Santa Barbara.  If you require " \
      "anything please reach out to us."
      expect(assigner).to eq(msg)
    end
  end
  
  context "given there are issues" do
    it "should error if any placeholders have no replacement in template" do
      holders << "Willnotbefound"
      expect{ TemplateAssigner.new(holders, inputs).process 
      }.to raise_error(KeyError)
    end
    
    it "should error if { or } are found in results" do
      inputs[:raw_template] = inputs[:raw_template] << "{"
      bad = TemplateAssigner.new(holders,inputs ).process
      expect{bad}.to raise_error ArgumentError, "A delimitor has been found. Possible placeholder issue"
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
      raw_template: raw_template_const, 
      deliminator: Deliminators.new('{','}'), 
      
      # company data
      id: 1, 
      company: "Hotel California", 
      city: "Santa Barbara", 
      timezone: "US/Pacific",
      
      # derived and passed in up the chain
      timeMessage: "Good Morning"
    }
  }
  
  let(:holders){
    ["timeMessage", "firstName", "lastName", "roomNumber", "company", "city"]
  }
end

