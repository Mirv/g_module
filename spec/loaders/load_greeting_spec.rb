load 'lib/loaders/load_message.rb'

describe "#initialize" do
  context "call to LoadMessage class" do
    let (:get_greeting) { LoadMessage.new(directory: "lib/data") }
      
    subject(:greeting) {
      get_greeting.execute_process
      get_greeting.data
    }
      
    it "should contain the keys in data var" do
      greet = greeting[:greetings].first
      expect(greet).to have_key(:message)
      expect(greet).to have_key(:start)
      expect(greet).to have_key(:stop)
    end
    
    it "should have record_lookup return hash with non empty" do
      greet = greeting[:greetings].first
      expect(greet[:message]).not_to be_nil
      expect(greet[:start]).not_to be_nil
      expect(greet[:stop]).not_to be_nil
    end
  end
end
  