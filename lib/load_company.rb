load 'load_file.rb'

class LoadCompany < LoadFile
  def self.load(file = 'Compnay.json', dir = 'lib/data')
    super
  end
end