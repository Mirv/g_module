# require 'loaders/load_json'
require 'match_utilities'
require_relative 'load_json'

## LoadMessage
#
# In:   nothing
# Opt:  :directory to find the Messages.json file
# out:  array of hashes to use for greeting message
#
class LoadMessage < LoadJson
  include MatchUtilities

  attr_reader :result
  
  def initialize(**args)
    dir =         args[:directory] || 'data'
    @file_name =  "#{dir}/Greetings.json"
    @result =       Hash.new
  end

  def execute_process
    return unless records = retrieve_json
    return unless records = records_to_hash_with_symbols(records)
    @result = {greetings: records}
  end
  
  def records_to_hash_with_symbols(records)
    hold = Array.new
    records.each do |record| 
      hold << {
        message: record[:message], 
        start: record[:start], 
        stop: record[:stop]
      }
    end
    hold
  end
end

