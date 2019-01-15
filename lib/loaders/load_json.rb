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
  def record_lookup(records_to_check, **args)
    byebug
    return if args.empty?   # no need to execute if empty
    record = nil            # assumes it doesn't pass
    
    # Begin test of each entry in array
    records_to_check.each do |entry|
      # Begin testing each conditional against an entry
      args.each {|k, v|puts record = entry if test_condition(entry, k, v) }

      # record = entry # if arg_check
      return record
    end
  end  
  
  def test_condition(entry, key, value)
    arg_checks = true
    
    # if any keys don't match goto next entry in array of records
    unless entry[key] == value
      return false  # exit the loop 
    end
    puts "Test: k: #{key} v: #{value}"
    return arg_checks
  end
  
end  




