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

  context "guest lookup should load reservation having keys" do
    it "should have roomNumber" do
      is_expected.to have_key('roomNumber')
      is_expected.to have_key('startTimestamp')

    end

    it "roomNumber & startTimestamp integers" do
      expect(reservation['roomNumber']).to be_a(Integer)
      expect(reservation['startTimestamp']).to be_a(Integer)
    end  
    
    it "roomNumber & startTimestamp should have lengths over one" do
      expect(reservation['roomNumber']).to be > 0
      expect(reservation['startTimestamp']).to be > 0
    end    

  end
end

    