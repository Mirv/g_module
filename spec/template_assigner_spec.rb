require 'template_assigner.rb'
require 'spec_helpers/test_constants.rb'

describe "Assigner" do 
  let(:assigner){
    TemplateAssigner.new(holders, inputs).process
  }
    
  let(:inputs){
    template_assigner_constant
  }
  
  let(:holders){
    ["timeMessage", "firstName", "lastName", "roomNumber", "company", "city"]
  }
  
  context "loads successfully" do
    it "should create object" do
      expect(assigner).to be_truthy
    end
    
    it "should load hashes to be parsed to template" do
      expect{assigner}.to_not raise_error 
    end
    
    it "should generate a message" do
      expect(assigner).to eq(template_assigner_should_gen_message)
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
      expect{ TemplateAssigner.new(holders,inputs).process 
      }.to raise_error(ArgumentError)
    end
  end
end

