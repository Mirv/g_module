load 'greet/range.rb'

describe "#initialize Range" do
  context "call to class" do
    let (:time_range) { Greet::Range.new(0, 24) }
    
    it "should return true if valid range" do
      expect(time_range.validated?).to be_truthy
    end
    
    it "should return true if in range" do
      expect(time_range.in_range?(5)).to be true
    end
    
    it "should return false if target too low" do
      expect(time_range.in_range?(-1)).to be false
    end
    
    it "should return false if target too high" do
      expect(time_range.in_range?(25)).to be false
    end
  end
end

      