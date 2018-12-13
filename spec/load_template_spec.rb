require 'spec_helper.rb'
load 'lib/load_template.rb'
require 'json_requires'     # json setup & testing data

describe ".load" do
  context "loaded template" do
    let (:template) { 
      template = LoadTemplate.new(
        first: "Candy", last: "Pace", template: "Default", 
        company: "The Prancing Pony", directory: "lib/data")
    }

    it "should have record_lookup return hash with key template" do
      template.execute_process
      expect(template.data).to have_key("template")
    end
    
    it "should be a string" do
      template.execute_process
      expect(template.data['template']).to be_a(String)
    end  
    
    it "should have record_lookup return hash with key template" do
      template.execute_process
      expect(template.data['template']).not_to be_empty
    end
  end
end

