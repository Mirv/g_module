require 'load_data.rb'

class LoadTemplate < LoadData
  
  def self.load(dir = 'lib/data', file = 'Guests.json')
    target = File.join(dir, file)
    File.open(target)
  end
end

# File.join(Dir.pwd,'some-dir','some-file-name')W