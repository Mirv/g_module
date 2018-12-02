load 'load_file.rb'

class LoadTemplate < LoadFile
  def self.load(file = 'Templates.json', dir = 'lib/data')
    super
  end
end