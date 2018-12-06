load 'load_company.rb'
require 'json'

describe ".load" do
  context "call to LoadCompany class" do
    it "should contain key for company" do
      expect(json_body.first).to have_key('company')
    end
  end
  
  def json_body
    JSON.parse(LoadCompany.load('lib/data/Company.json').read)
  end
end
