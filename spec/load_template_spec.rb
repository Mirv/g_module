require 'load_template.rb'
require 'json'

describe ".load" do
  context "call to LoadTemplate class" do
    it "should contain key template" do
      expect(json_body.first).to have_key('template')
    end
  end
  
  def json_body
    JSON.parse(LoadTemplate.load('lib/data/Templates.json').read)
  end
end
