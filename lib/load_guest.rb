load 'load_json.rb'

# Load in the guest info from file based on combined name

class LoadGuest < LoadJson
  attr_reader :data

  def initialize(**args)
    dir = args[:directory] || 'data'
    @file_name = "#{dir}/Guests.json"
    @first = args[:first] 
    @last = args[:last] 
  end

  def execute_process
    return unless file = opener(@file_name)
    return unless record = process_json(file)
    return unless record = record_lookup(
        record, 
        firstName: @first, 
        lastName: @last) 
    @data = record['reservation']
  end

end
