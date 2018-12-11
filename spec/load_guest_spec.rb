require 'load_guest.rb'
require 'json'

describe "#initialize" do
  let(:reservation){ 
    LoadGuest.new(firstName: 'Candy',lastName: 'Pace', directory: 'lib/data') }
  
  context "guest lookup should load reservation" do
    it "should have roomNumber" do
      setup = reservation.execute_process
      expect(reservation.data).to have_key('roomNumber')
    end
    
    it "should have startTimestamp" do
      setup = reservation.execute_process
      expect(reservation.data).to have_key('startTimestamp')
    end
  end
end

    