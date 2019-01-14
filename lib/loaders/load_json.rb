load 'loaders/load_file.rb'
require 'json'

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

  # Note:  key name must match json key name to match data
  def record_lookup0(record_to_check, **args)
    return if args.empty?
    record = nil  # assumes it doesn't pass
    record_to_check.each do |entry|
      args.each do |key, value|
        # if any key doesn't skip to next entry in array of hashes
        unless entry[key] == value
          arg_checks = false 
          next  # exit the loop 
        end
      end
      record = entry 
      return record
    end
  end  

  def record_lookup2(record_to_check, **args)
    return nil unless args.all? {|k, v| entry[k] == v}
    record_to_check
  end

  def record_lookup4(record_to_check, **args)
    return if args.empty?
    record_to_check.each do |entry|
      args.each do |key, value|
        # if any key doesn't skip to next entry in array of hashes
        return nil unless entry[key] == value
      end
      record = entry
    end
  end
  
  # Default
  def record_lookup5(record_to_check, **args)
    return if args.empty?
    record = nil  # assumes it doesn't pass
    record_to_check.each do |entry|
      arg_check = true
      arg_check = args.any? { |k, v| entry[k] == v }
      record = entry if arg_check
      return record
    end
  end  

  # Array of hashes - Single or multiple variable match to match a record
  def record_lookup(record_to_check, **args)
    return if args.empty?   # no need to execute if empty
    record = nil            # assumes it doesn't pass
    
    # Begin test of each entry in array
    record_to_check.each do |entry|
      # arg_check = true # all hashes must match to be valid, any neg subtracts
      
      # Begin testing each conditional against an entry
      args.each do |key, value|
        # if record failed to match any conditions, skip to checking next record
        # ... in the array of records
        test_conditions_match(entry, key, value)
      end

      record = entry # if arg_check
      puts record
      return record
    end
  end  
  
  def test_conditions_match(entry, key, value)
    arg_check = true
    
    # if any keys don't match goto next entry in array of records
    unless entry[key] == value
      arg_checks = false 
      return  # exit the loop 
    end
    return arg_checks
  end
  
end  




