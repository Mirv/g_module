require 'template_tool.rb'
require 'spec_helpers/test_constants.rb'

describe "template initialized" do
  let(:template) { templater(inputs.dup) }
  context "successfully initialized" do

    it "should have a working object" do
      puts template
      expect(template.result).to be_truthy
    end
    
    it "should retrieve a non-default greeting" do
      expect(template.retrieve_greeting(inputs.dup)).to_not eq("Messages")
    end
    
    it "should retrieve template to use" do
      temp = template.retrieve_placeholders #(placeholders)
      expect(temp.pull_holders.count).to be > 0
      expect(temp.pull_holders).to_not include(:template)
    end
    
    it "should fill a template with all the placeholder markers removed" do
      # expect(template.result)
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
      timezone: "US/Pacific"
    }
  }
  
  let(:placeholders){
    {
      raw_template: raw_template_const, 
      deliminator: Deliminators.new('{','}')
    }
  }
end

def templater(values)
  TemplateTool.new(values)
end