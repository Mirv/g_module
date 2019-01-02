load 'lib/loaders/load_greeting.rb'

describe "#initialize" do
  context "call to LoadGreeting class" do
    let (:get_greeting) { LoadGreeting.new(directory: "lib/data") }
      
    subject(:greeting) {
      get_greeting.execute_process
      get_greeting.data
    }
      
    it "should contain the keys in data var" do
      expect(greeting).to have_key(:greetings)
      greet = greeting[:greetings].first
      expect(greet).to have_key(:message)
      expect(greet).to have_key(:start)
      expect(greet).to have_key(:stop)
    end
    
    it "should have record_lookup return hash with non empty" do
      greet = greeting[:greetings].first
      expect(greet).not_to be_empty
      expect(greet).not_to be_empty
      expect(greet).not_to be_empty
    end

  end
end
  