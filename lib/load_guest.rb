load 'load_file.rb'

class LoadGuest < LoadFile
  attr_reader :data
  
  def initialize(**args)
    dir = args[:directory] || 'data'
    first = args[:first] 
    last = args[:last] 
    return unless file = LoadGuest.load("#{dir}/Guests.json")
    return unless record = pull_customer(file)
    return unless record = record_lookup(record, first, last) 
    @data = record['reservation']
  end

  def load(directory: 'data/Guests.json')
    begin
      super(directory)
    rescue Errno::ENOENT => e
      # send to log files eventually
      puts "#{e}"
      e_location
      puts "object #{self.inspect}"
      return nil
    end
  end

  # assumes last listed entry is the most current TODO - detect multipe entries
  def pull_customer(source)
    return JSON.parse(source.read)
  end

  # if nothing found it's nil 
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