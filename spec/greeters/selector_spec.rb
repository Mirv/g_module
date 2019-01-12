load 'greet/selector.rb'

describe "#initialize MessageSelector" do
  context "call to class" do
    let (:greeting_hash) {
      msgs = [
          {message: "Good Morning", start: 0, stop: 10}, 
          {message: "Good Day", start: 10, stop: 16}, 
          {message: "Good Evening", start: 16, stop: 24}
        ]
      Selector.data_from_array_of_hashes(msgs)
    }
    
    it "should return message if valid inputs and in range" do
      expect(greeting_hash.find(5).message).to include("Good Morning")
    end
    
    it "should return nil if nothing was valid" do
      expect(greeting_hash.find(25)).to be_nil
    end
  end
end

