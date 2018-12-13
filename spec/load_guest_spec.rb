require 'load_guest.rb'
require 'json'

describe "#initialize" do
  let(:guest) { 
    LoadGuest.new(firstName: 'Candy', lastName: 'Pace', directory: 'lib/data') 
  }
  subject(:reservation) {
    guest.execute_process
    guest.data
  }

  context "guest lookup should load reservation" do
    it "should have roomNumber" do
      is_expected.to have_key('roomNumber')
    end

    it "roomNumber should be longer than 1 character" do
      expect(reservation['roomNumber']).to be_a(Integer)
    end  
    
    it "roomNumber should be longer than 1 character" do
      expect(reservation['roomNumber']).to be > 0
    end    
    
    it "should have startTimestamp" do
      expect(reservation).to have_key('startTimestamp')
    end
    
    it "should have valid startTimestamp" do
      expect(reservation['startTimestamp']).to be_a(Integer)
    end
    
    it "should have valid startTimestamp" do
      expect(reservation['startTimestamp']).to be > 0
    end
  end
end

    