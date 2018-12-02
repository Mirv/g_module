require 'load_guest.rb'
require 'json'

describe ".load" do
  context "callto LoadGuest class" do
    it "should load and have firstname" do
      human_error = "no firstname found"
      expect(json_body.first).to have_key('firstName'), human_error
    end
  end
  
  def json_body
    JSON.parse(LoadFile.load('Guests.json', 'lib/data').read)
  end
end