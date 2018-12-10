load 'load_json.rb'

class LoadCompany < LoadJson
  def self.load(file = 'lib/data/Company.json')
    super
  end
end