require 'spec_helper.rb'
require 'loaders/load_template'
require 'spec_helpers/record_lookup_files'

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
      template_holder.first[:template]
    }

    it "should have record_lookup return template object" do
      expect(template_test.raw).to be_truthy
      expect(template_test.start).to_not be_empty
      expect(template_test.stop).to_not be_empty
    end
    
    it "should be a the valid string return" do
      expect(template_test.raw).to be_a(String)
      expect(template_test.raw).to eq(template_value)
    end  
    
    it "should have record_lookup return hash with non empty" do
      expect(template_test).to_not be_nil
      expect(template_test.start).not_to be_empty
      expect(template_test.stop).not_to be_empty
    end
  end
end

