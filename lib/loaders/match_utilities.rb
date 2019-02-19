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
    return "Failed" if args.empty?   # no need to execute if empty
    # cycling all possible matches 
    records_to_check.each do |entry|
      # puts "entry is #{entry} #{args.all? {|k, v| entry[k] == v ? true : false}}"
      # An entry needs to pass all checks held in args to be valid
      record = args.all? {|k, v| entry[k] == v ? true : false}
      # if we find it matches all checks - we can just return the value found
      return entry if record 
    end
  end  
end
