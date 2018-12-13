require 'spec_helper.rb'
load 'lib/load_template.rb'
require 'json_requires'     # json setup & testing data

describe ".load" do
  context "loaded template" do
    let(:template_loader) { loader = LoadTemplate.new(
      first: "Candy", last: "Pace", template: "Default", 
      company: "Hotel California", directory: "lib/data")
    }
    
    let (:template_test) { 
      template_loader.execute_process
      template_loader.data
    }

    it "should have record_lookup return hash with key template" do
      expect(template_test).to have_key("template")
    end
    
    it "should be a string" do
      expect(template_test['template']).to be_a(String)
    end  
    
    it "should have record_lookup return hash with key template" do
      expect(template_test['template']).not_to be_empty
    end
  end
end

