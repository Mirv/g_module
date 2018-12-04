load 'load_data.rb'

class LoadFile < LoadData
  def self.load(file = 'Guests.json', dir = 'data')
    target = File.open(File.join(dir, file))
  end
end