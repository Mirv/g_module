load 'greeting_system.rb'

describe "#intialization" do
  context "class object inputs" do
    let(:greeting) { GreetingSystem.new(valid_inputs.dup) }

    it "should have successfully initialized" do
      expect(greeting).to be_truthy
    end
  end
end

def valid_inputs
  {
    firstName: "Candy", lastName: "Pace", template: "Default", 
    company: "The Grand Budapest Hotel", directory: "lib/data"
  }
end

def greet(hash)
  GreetingSystem.new(hash)
end
  
