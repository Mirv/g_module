require 'load_template.rb'

describe ".load" do
  context "call to LoadTemplate class" do
    it "should contain key template" do
      human_error = "file should open contain template key in first entry"
      expect(json_body.first).to have_key('template'), human_error
    end
  end
  
  def json_body
    JSON.parse(LoadTemplate.load('Templates.json', 'lib/data').read)
  end
end
