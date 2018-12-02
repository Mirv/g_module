load 'load_file.rb'

class LoadGuest < LoadFile
  def self.load(file = 'Guests.json', dir = 'data')
    super
  end
end