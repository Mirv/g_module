load 'load_file.rb'

class LoadTemplate < LoadFile
  def self.opener(file = 'data/Templates.json')
    super
  end
end