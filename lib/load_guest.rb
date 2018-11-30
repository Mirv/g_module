load 'load_file.rb'

class LoadGuest < LoadFile
  def self.load(file = 'Guests.json', dir = 'lib/data')
    super
  end
end