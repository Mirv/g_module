require 'spec_helper.rb'
require 'loaders/load_template'

describe ".load" do
  context "loaded template" do
    let(:template_loader) { LoadTemplate.new(
      first: "Candy", last: "Pace", template: "Default", 
      company: "Hotel California", directory: "lib/data")
    }
    
    let (:template_test) { 
      template_loader.execute_process
      template_loader.result
    }
    
    let (:template_value){
      "{timeMessage} {firstName} {lastName}. Room number {roomNumber} is now " \
      "available for your use at {company} in {city}.  If you require " \
      "anything please reach out to us."
    }

    it "should have record_lookup return hash with key template" do
      expect(template_test).to have_key(:raw_template)
      expect(template_test).to have_key(:deliminator)
      expect(template_test[:deliminator].start).to_not be_empty
      expect(template_test[:deliminator].stop).to_not be_empty
    end
    
    it "should be a the valid string return" do
      expect(template_test[:raw_template]).to be_a(String)
      expect(template_test[:raw_template]).to eq(template_value)
    end  
    
    it "should have record_lookup return hash with non empty" do
      expect(template_test[:raw_template]).not_to be_empty
      expect(template_test[:deliminator]).to_not be_nil
      expect(template_test[:deliminator].start).not_to be_empty
      expect(template_test[:deliminator].stop).not_to be_empty
    end
  end
end

