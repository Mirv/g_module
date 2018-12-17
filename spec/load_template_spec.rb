require 'spec_helper.rb'
load 'loaders/load_template.rb'
require 'json_requires'     # json setup & testing data

describe ".load" do
  context "loaded template" do
    let(:template_loader) { LoadTemplate.new(
      first: "Candy", last: "Pace", template: "Default", 
      company: "Hotel California", directory: "lib/data")
    }
    
    let (:template_test) { 
      template_loader.execute_process
      template_loader.data
    }

    it "should have record_lookup return hash with key template" do
      expect(template_test).to have_key(:raw_template)
      expect(template_test).to have_key(:deliminator)
      expect(template_test[:deliminator]).to have_key('start')
      expect(template_test[:deliminator]).to have_key('stop')
    end
    
    it "should be a string" do
      expect(template_test[:raw_template]).to be_a(String)
    end  
    
    it "should have record_lookup return hash with non empty" do
      expect(template_test[:raw_template]).not_to be_empty
      expect(template_test[:deliminator]).not_to be_empty
      expect(template_test[:deliminator]['start']).not_to be_empty
      expect(template_test[:deliminator]['stop']).not_to be_empty
    end
  end
end

