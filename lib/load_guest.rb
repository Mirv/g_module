load 'load_file.rb'

class LoadGuest < LoadFile
  # since we have first/last name already, only need reservation
  attr_reader :reservation
  
  def initialize(first_name, last_name, dir = 'data')
    @first_name = first_name
    @last_name = last_name
    file = LoadGuest.load('Guests.json', dir)
    record = record_lookup(pull_customer(file))
    @reservation = record['reservation']
  end
  
  def self.load(file = 'Guests.json', dir = 'data')
    super
  end

  # assumes last listed entry is the most current TODO - detect multipe entries
  def pull_customer(source)
    data = JSON.parse(source.read)
  end

  def record_lookup(data)
    record = nil
    data.each do |x|
      record = x if (x['firstName'] == @first_name && x['lastName'] == @last_name)
    end
    return record
  end
end