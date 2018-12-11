require 'load_template.rb'
require 'json'

describe ".load" do
  context "loaded template" do
    let (:template) { template = LoadTemplate.new(
      first: "Candy", last: "Pace", template: "Default", 
      company: "The Prancing Pony", directory: "lib/data") }
    
    it "should have opener return successfully" do
      expect(template.opener('lib/data/Templates.json')).to be_truthy
    end
    
    it "should have record_lookup return hash with key template" do
      template.execute_process
      expect(template.data).to have_key("template")
    end
    
    it "should have record_lookup return hash with key template" do
      template.execute_process
      expect(template.data['template']).not_to be_empty
    end
    
    it "should have all '{' followed '}'" do 
      template.execute_process
    end
  end
end
