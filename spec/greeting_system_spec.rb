load 'greeting_system.rb'

describe "#intialization" do
  context "class object inputs" do
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
  end
  
  context "a class method" do
    let(:greeting) { valid_greeting }

    it "should have first name set" do
      expect(greeting).to be_truthy
    end
    
    it "should have successfully set the reservation room" do
      greeting.hand_process
      expect(greeting.data).to include("roomNumber" => 529)
    end
    
    it "should have successfully set the reservation time" do
      greeting.hand_process
      expect(greeting.data).to include("startTimestamp" => 1486654792)
    end
  end
end

describe "#intialization" do
  context "hand_process" do
    let(:greeting) { valid_greeting }

    it "should load reservation hash" do
      greeting.hand_process
      expect(greeting.data).to have_key("roomNumber")
    end
    
    it "should load reservation hash" do
      greeting.hand_process
      expect(greeting.data).to have_key("startTimestamp")
    end

    it "should have valid roomNumber" do
      expected = 0
      greeting.hand_process
      expect(greeting.data['roomNumber']).to be > expected
    end
    
    it "should have valid roomNumber" do
      expected = 0
      greeting.hand_process
      expect(greeting.data['startTimestamp']).to be > expected
    end
  end
end

def valid_greeting
  GreetingSystem.new(first: "Candy", last: "Pace", template: "t",company: "c", directory: "lib/data")
end