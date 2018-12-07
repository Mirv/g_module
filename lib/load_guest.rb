load 'load_file.rb'

class LoadGuest < LoadFile
  attr_reader :data
  
  def initialize(**args)
    dir = args[:directory] || 'data'
    return unless first = args[:first] 
    return unless last = args[:last] 
    return unless file = LoadGuest.load("#{dir}/Guests.json")
    return unless record = pull_customer(file)
    return unless record = record_lookup(record, first, last) 
    @data = record['reservation']
  end

  def load(directory: 'data/Guests.json')
    begin
      super(directory)
    rescue Errno::ENOENT => e
      puts "#{e}"
      puts "Calling file '#{__FILE__}' -- object #{self.inspect}'"
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
end