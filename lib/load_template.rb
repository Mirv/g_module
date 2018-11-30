load 'load_file.rb'

class LoadTemplate < LoadData
  def self.load(dir = 'lib/data', file = 'Guests.json')
    target = File.join(dir, file)
    return File.open(target)
  end
end