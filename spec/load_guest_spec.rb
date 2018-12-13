require 'load_guest.rb'
require 'json'

describe "#initialize" do
  let(:reservation){ 
    LoadGuest.new(firstName: 'Candy',lastName: 'Pace', directory: 'lib/data') 
  }
  
  context "guest lookup should load reservation" do
    it "should have roomNumber" do
      reservation.execute_process
      expect(reservation.data).to have_key('roomNumber')
    end

    it "roomNumber should be longer than 1 character" do
      reservation.execute_process
      expect(reservation.data['roomNumber']).to be_a(Integer)
    end  
    
    it "roomNumber should be longer than 1 character" do
      reservation.execute_process
      expect(reservation.data['roomNumber']).to be > 0
    end    
    
    it "should have startTimestamp" do
      reservation.execute_process
      expect(reservation.data).to have_key('startTimestamp')
    end
    
    it "should have valid startTimestamp" do
      reservation.execute_process
      expect(reservation.data['startTimestamp']).to be_a(Integer)
    end
    
    it "should have valid startTimestamp" do
      reservation.execute_process
      expect(reservation.data['startTimestamp']).to be > 0
    end
  end
end

    