load 'loaders/load_guest.rb'
load 'loaders/load_company.rb'

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
  context "given maches" do
    let(:customers){ 
      [{"firstName": "Candy",   "lastName": "Pace"},
      {"firstName": "Morgan",   "lastName": "Porter"},
      {"firstName": "Bridgett", "lastName": "Richard"}]
    }
    
    let(:single_criteria){{"lastName": "Porter"}}
    let(:double_criteria){{"firstName": "Morgan",   "lastName": "Porter"}}
    
    it "should load an object for double lookup" do
      customer_lookup = LoadGuest.new(double_criteria)
      expect(customer_lookup).to_not be_nil
    end

          
    it "should find customer match based on single criteria" do
    end
    
    it "should find customer match based on multiple criteria" do
      customer_lookup = LoadGuest.new(double_criteria.merge!({directory: "lib/data"})).execute_process
      # byebug
      expect(customer_lookup).to_not be_nil
    end
  end
  
  context "given no matches" do
    it "should fail on single criteria" do
    end
    
    it "should fail on multiple criteria" do
    end
  end
end

