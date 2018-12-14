load 'greeting_system.rb'

describe "#intialization" do
  context "class object inputs" do
    let(:greeting) { GreetingSystem.new(valid_inputs) }

    it "should have successfully initialized" do
      expect(greeting).to be_truthy
    end
    
    it "test should fail to make new object if first null" do
      expect{ greet((valid_inputs.merge!(firstName: ""))) 
      }.to raise_error(ArgumentError, "First Name was empty")
    end
    
    it "should fail to make new object if last null" do
      expect{ greet((valid_inputs.merge!(lastName: ""))) 
      }.to raise_error(ArgumentError, "Last Name was empty")
    end

    it "should fail to make new object if company null" do
      expect{ greet((valid_inputs.merge!(company: "")))
      }.to raise_error(ArgumentError, "Company Name was empty")
    end

    it "should fail to make new object if tempalte null" do
      expect{ greet((valid_inputs.merge!(template: "")))
      }.to raise_error(ArgumentError, "Template Name was empty")
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
  
