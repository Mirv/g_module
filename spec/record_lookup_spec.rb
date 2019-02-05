require 'match_utilities'
require 'logging'
# load 'loaders/load_company.rb'

include MatchUtilities

require 'byebug'
# Pseudo code

# loop thru array of all customers till found or out of customers
#   call function to loop through through all criteria on current customer
#   if return is true from criteria function, return current customer
    
# function to loop through through all criteria with current customer as target
#   # all checks must be true in here or it's not a match
  
#   # value starts as true and only changes if a false is found
#   found flag set to true
#   loop through all criteria
#     call function to run check of single criteria against target
#     set found flag to false if any criteria tests are false
#   return current customer if found flag still true (it matched 100% criteria)
      
# call function to run check of single criteria 
#   return false if check fails
#   return true

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

  
  context "given no matches" do
    it "should fail on single criteria" do
    end
    
    it "should fail on multiple criteria" do
    end
  end
end

