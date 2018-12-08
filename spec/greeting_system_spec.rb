load 'greeting_system.rb'

describe "#intialization" do
  context "class object inputs" do
    let(:greeting) { valid_greeting }
    it "should fail to make new object if first null" do
      expect{GreetingSystem.new(first: "", last: "l", company: "c", template: "d")}.
        to raise_error(ArgumentError, "First Name was empty")
    end

    it "should fail to make new object if last null" do
      expect{GreetingSystem.new(first: "f", last: "", company: "c", template: "d")}.
      to raise_error(ArgumentError, "Last Name was empty")
    end

    it "should fail to make new object if company null" do
      expect{GreetingSystem.new(first: "f", last: "l", company: "", template: "d")}.
      to raise_error(ArgumentError, "Company Name was empty")
    end

    it "should fail to make new object if tempalte null" do
      expect{GreetingSystem.new(first: "f", last: "l", company: "c", template: "")}.
      to raise_error(ArgumentError, "Template Name was empty")
    end
    
    it "should have successfully initialized" do
      expect(greeting).to be_truthy
    end
  end
end
  
describe "#post intialization" do
  context "hand_process" do
    let(:greeting) { valid_greeting }
    let(:bad_directory) { GreetingSystem.new(first: "Candy", last: "Pace", 
        template: "t",company: "c", directory: "asdf") }

    it "should load reservation hash with key roomNumber" do
      greeting.hand_process
      expect(greeting.data).to have_key("roomNumber")
    end
    
    it "should load reservation hash with key startTimestamp" do
      greeting.hand_process
      expect(greeting.data).to have_key("startTimestamp")
    end

    it "should have valid roomNumber" do
      greeting.hand_process
      expect(greeting.data['roomNumber']).to be > 0
    end
    
    it "should have valid roomNumber" do
      greeting.hand_process
      expect(greeting.data['startTimestamp']).to be > 0
    end
    
    it "should raise an error if file doesn't load" do
      expect(bad_directory.hand_process).to be_nil
    end
  end
end

def valid_greeting
  GreetingSystem.new(first: "Candy", last: "Pace", template: "t",company: "c", directory: "lib/data")
end