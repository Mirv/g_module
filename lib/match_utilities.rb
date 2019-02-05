module MatchUtilities

  ## record_lookup Array of hashes - Single or multiple variable match 1 record
  #  In:  
  #     records_to_check as array holding hashes of all the records to search...
  #     args as hash of keys & values that are required for a record to be matched
  #  Out:
  #     first record matching all required fields from args
  #  Note:
  #     current search return behavior is greedy - TODO - allow both modes?
  #
  def record_lookup(records_to_check, **args)
    return if args.empty?   # no need to execute if empty
    # cycling all possible matches 
    records_to_check.each do |entry|
      # An entry needs to pass all checks held in args to be valid
      record = args.all? {|k, v| entry[k] == v ? true : false}
      # if we find it matches all checks - we can just return the value found
      return entry if record 
    end
  end  
end

#   context "given maches with live including class" do
#     let(:single_criteria){{"lastName": "Porter"}}
#     let(:multiple_criteria){{"firstName": "Morgan", "lastName": "Porter"}}
    
#     it "should not raise error" do
#       expect{LoadGuest.new(multiple_criteria)}.to_not raise_error
#     end
    
#     it "should to raise error" do
#       expect{LoadGuest.new('')}.to raise_error ArgumentError
#     end

#     it "should load an object for multiple criteria" do
#       customer_lookup = LoadGuest.new(multiple_criteria)
#       expect(customer_lookup).to_not be_nil
#     end

#     it "should find customer match based on single criteria" do
#     end
    
#     # this compares against live object - not the search method
#     it "should find customer match based on multiple criteria" do
#       inputs = multiple_criteria.merge!({directory: "lib/data"})
#       #
#       ## TODO - needs to be stubbed or such?
#       #
#       customer_lookup = LoadGuest.new(inputs)
#       customer_lookup.execute_process
#       expect(customer_lookup.result).to_not be_nil
#     end
#   end