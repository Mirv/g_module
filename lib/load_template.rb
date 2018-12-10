load 'load_json.rb'

class LoadTemplate < LoadJson
  def self.opener(file = 'data/Templates.json')
    super
  end
end