load 'load_file.rb'

class LoadCompany < LoadFile
  def self.load(file = 'lib/data/Company.json')
    super
  end
end