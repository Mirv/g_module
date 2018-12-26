load 'loaders/load_json.rb'
require 'byebug'

## LoadGreating
#
# In:   nothing
# out:  array of hashes to use for greeting message
#
class LoadGreeting < LoadJson
  attr_reader :data
  
  def initialize(**args)
    dir =         args[:directory] || 'data'
    file_name =   "#{dir}/Greetings.json"
    @file_name =  args[:file_name] || file_name
    @data =       Hash.new
  end

  # TODO - execute process could be annonymized by adding a target hash key ...
  def execute_process
    return unless file = opener(@file_name)
    return unless records = process_json(file)
    return unless records = records_to_hash_with_symbols(records)
    @data = {greetings: records}
  end
  
  def records_to_hash_with_symbols(records)
    hold = Array.new
    records.each do |r| 
      hold << {
        message: r['message'], 
        start: r['start'], 
        stop: r['stop']
      }
    end
    hold
  end
end