require 'match_utilities'
require 'logging'
require 'loaders/load_template'
require_relative 'spec_helpers/record_lookup_files'  # test data independent of the class

include MatchUtilities

describe "record lookup data integrity" do

  context "testing search method" do
    let(:single_criteria){ {"lastName": "Porter"} }
    let(:multiple_criteria){ {"firstName": "Morgan", "lastName": "Porter"} }
    let(:customers){ guest_holder }
    let(:templates){ template_holder }
    
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
    
    it "should find single lookup entries other than the first" do
      match = record_lookup(templates, {name: "Bond Style"})
      expect(match).to have_key(:id)
      expect(match[:id]).to eq(2)
    end
  end
end
