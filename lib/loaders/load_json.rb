load 'loaders/load_file.rb'
require 'json'
require 'byebug'
class LoadJson < LoadFile
  attr_reader :result
  
  def process_json(source)
    begin
    # byebug
      value = JSON.parse(source, { symbolize_names: true })
    rescue JSON::ParserError, TypeError => e
      # TODO -- inject logger
      # puts "JSON ERROR BEING RESCUED"
      return nil
    end
    return value
  end

  ## Array of hashes - Single or multiple variable match to match a record
  #  In:  
  #     records_to_check as array holding hashes of all the records to search
  #     args as hash of keys & values that are required for a record to be matched
  #  Out:
  #     first record matching all required fields from args
  #
  def record_lookup(records_to_check, **args)
    return if args.empty?   # no need to execute if empty
    # cycling all possible matches 
    records_to_check.each do |entry|
      # An entry needs to pass all checks held in args to be valid
      record = args.all? {|k, v| entry[k] == v ? true : false}
      # if we find it matches all checks - we can just return the value found
      # TODO - do we want to get multiple if they exist and let caller pick one?
      return entry if record 
    end
  end  
end  




