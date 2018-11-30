# require 'load_data.rb'

class LoadFile < LoadData
  def self.load(file, dir = 'lib/data')
    target = File.join(dir, file)
    return File.open(target)
  end
end