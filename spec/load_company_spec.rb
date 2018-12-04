load 'load_company.rb'
require 'json'

describe ".load" do
  context "call to LoadCompany class" do
    it "should contain key for company" do
      human_error = "file should open contain company key in first entry"
      expect(json_body.first).to have_key('company'), human_error
    end
  end
  
  def json_body
    JSON.parse(LoadCompany.load('Company.json', 'lib/data').read)
  end
end
