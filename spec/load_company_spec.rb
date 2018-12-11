# require 'json'
load 'load_company.rb'

describe "#initialize" do
  context "call to LoadCompany class" do
    let (:company) { 
      company = LoadCompany.new(
      first: "Candy", last: "Pace", template: "Default", 
      company: "The Prancing Pony", directory: "lib/data") 
    }
      
    it "should contain key for company in data when done" do
      company.execute_process
      expect(company.data).to have_key('company')
    end
    
    it "should contain key for timezon in data when done" do
      company.execute_process
      expect(company.data).to have_key('timezone')
    end
    
    it "should contain value for company in data when done" do
      company.execute_process
      expect(company.data['company']).to_not be_empty
    end
    
    it "should contain key for timezon in data when done" do
      company.execute_process
      expect(company.data['timezone']).to_not be_empty
    end
  end
end
  