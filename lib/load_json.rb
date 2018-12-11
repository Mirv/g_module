load 'load_file.rb'
require 'json'

class LoadJson < LoadFile
  attr_reader :data
  
  # assumes last  entry is the most current TODO - detect multipe entries
  def process_json(source)
    begin
      value = JSON.parse(source)
    rescue JSON::ParserError, TypeError => e
      # inject logger
      puts "JSON ERROR BEING RESCUED"
      return nil
    end
    return value
  end

  # Note:  key name must match json key name to match data
  def record_lookup(data, **args)
    return if args.empty?
    record = nil  # assumes it doesn't pass
    # arg_count = args.count #
    data.each do |entry|
      arg_check = true # all hashes must match to be valid, any neg subtracts
      args.each do |key, value|
        # unless key_match?(entry, key, value)
        unless entry[key] == value
          arg_checks = false 
          next
        end
      end
      record = entry if arg_check
      return record
    end
  end  # this might be extra c9 being weird code checking
  
end  
