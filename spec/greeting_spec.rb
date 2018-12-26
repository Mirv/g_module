load 'greeting.rb'

describe "#initialize Greeting" do
  context "call to class" do
    let (:greeting) { Greeting.new("ALL DAY", TimeRange.new(0, 24)) }
    
    it "should return message if valid inputs and in range" do
      expect(greeting.in_effect?(5)).to include("ALL DAY")
    end
    
    it "should return nil if nothing was valid" do
      expect(greeting.in_effect?(25)).to be_nil
    end
  end
end

