require 'load_guest.rb'
require 'json'

describe "#initialize" do
  let(:entry) { entry = json_body[1] }
  let(:guest_reservation){ LoadGuest.new(first: 'Candy',last: 'Pace', directory: 'lib/data') }
  
  context "guest lookup should load reservation" do
    it "should have roomNumber" do
      setup = guest_reservation.execute_process
      expect(guest_reservation.data).to have_key('roomNumber')
    end
    
    it "should have startTimestamp" do
      setup = guest_reservation.execute_process
      expect(guest_reservation.data).to have_key('startTimestamp')
    end
  end
end

describe ".load" do
  # picking a random entry - should stop this static json at somepoint
  let(:entry) { entry = json_body[1] }
  let(:reserved) {reserved = json_body[1]['reservation'] }

  context "Guest JSON file" do
    it "should have firstName" do
      expect(entry).to have_key('firstName'), "firstName key missing"
    end
    
    it "should have lastName" do
      expect(entry).to have_key('lastName'), "lastName key missing"
    end

    it "should have reservation" do
      expect(entry).to have_key('reservation')
    end
    
    it "should have reservation containing roomNumber" do
      expect(reserved).to have_key('roomNumber')
    end
    
    it "should load new object from file with lastName" do
      expect(json_body.first).to have_key('lastName')
    end
  end
end

def json_body
  guest = LoadGuest.new(first: "Candy",last: "Pace",dir: "data")
  JSON.parse(guest.opener('lib/data/Guests.json'))
end

    