require 'match_utilities'
require 'logging'
# load 'loaders/load_company.rb'

include MatchUtilities

describe "record lookup data integrity" do

  context "testing search method" do
    let(:single_criteria){{"lastName": "Porter"}}
    let(:multiple_criteria){{"firstName": "Morgan", "lastName": "Porter"}}
    let(:customers){ 
      [{"firstName": "Candy",   "lastName": "Pace"},
      {"firstName": "Morgan",   "lastName": "Porter"},
      {"firstName": "Bridgett", "lastName": "Richard"}]
    }
    
    it "should match criteria without error" do
      expect{record_lookup(customers, multiple_criteria)}.to_not raise_error
    end

    it "should match without being nil" do
      match = record_lookup(customers, multiple_criteria)
      expect(match).to_not be_nil
    end
    
    it "should match multiple criteria in same record" do
      matches = record_lookup(customers, multiple_criteria)
      values = matches.fetch_values(:firstName, :lastName)  
      expect(values).to eq(%w{Morgan Porter})
    end
    
    it "should match single criteria in same record" do
      match = record_lookup(customers, single_criteria)
      expect(match).to_not be_nil
    end
  end
end

