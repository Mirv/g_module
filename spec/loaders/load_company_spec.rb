require 'loaders/load_company'

describe "#initialize" do
  context "call to LoadCompany class" do
    let (:get_company) { LoadCompany.new(
      firstName: "Candy", lastName: "Pace", template: "Default", 
      company: "Hotel California", directory: "lib/data") }
      
    subject(:company) {
      get_company.process
      get_company.result
    }
      
    it "should contain the right keys" do
      expect(company).to have_key(:company)
      expect(company).to have_key(:timezone)
    end

    it "should contain the right values" do
      expect(company[:company]).to_not be_empty
      expect(company[:company]).to eq("Hotel California")
      expect(company[:timezone]).to_not be_empty
      expect(company[:timezone]).to eq("US/Pacific")
    end
    
    it "should have valid startTimestamp" do
      expect(company[:company]).to be_a(String)
    end
  end
end
  