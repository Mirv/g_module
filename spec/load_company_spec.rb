# require 'json'
load 'load_company.rb'

describe "#initialize" do
  context "call to LoadCompany class" do
    let (:get_company) { LoadCompany.new(
      firstName: "Candy", lastName: "Pace", template: "Default", 
      company: "The Prancing Pony", directory: "lib/data") }
      
    subject(:company) {
      get_company.execute_process
      get_company.data
    }
      
    it "should contain the right keys" do
      expect(company).to have_key('company')
      expect(company).to have_key('timezone')
    end

    it "should contain the right values" do
      expect(company['company']).to_not be_empty
      expect(company['timezone']).to_not be_empty
    end
    
    it "should have valid startTimestamp" do
      expect(company['company']).to be_a(String)
    end
  end
end
  