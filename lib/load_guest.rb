load 'load_json.rb'
require 'json'

class LoadGuest < LoadJson
  def initialize(**args)
    @dir = args[:directory] || 'data'
    @first = args[:first] 
    @last = args[:last] 
  end

  def execute_process
    return unless file = opener("#{@dir}/Guests.json")
    return unless record = pull_records(file)
    return unless record = record_lookup(record, @first, @last) 
    @data = record['reservation']
  end

  def opener(directory ='data/Guests.json')
    super
  end

  def pull_records(source)
    super
  end

  # if nothing found it's nil 
  # using hash mapping as later we can spit out menu of all options if wrong
  def record_lookup(data, first_name, last_name)
    record = nil
    data.each do |x|
      record = x if (x['firstName'] == first_name && x['lastName'] == last_name)
    end
    return record
  end
  
  # dynamically finds the calling method name & file
  def err_location(msg = "")
    location = "#{caller_name} in #{__FILE__}"
    file_error = "#{msg} in #{location}"
  end
  
  def caller_name
    caller[0][/`([^']*)'/, 1]
  end
end