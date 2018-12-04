load 'greeting_system.rb'

describe "#intialization" do
  context "class object" do
    let(:greeting) {  GreetingSystem.new(first: "Candy",last: "Pace", company: "c", template: "d") }
    let(:bad_greeting) {  GreetingSystem.new(first: "",last: "", company: "", template: "") }
    it "should have first name set" do
      expect(greeting).to be_truthy
    end
    
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

    it "should have successfully set the reservation room and time" do
      expect(greeting.set_reservation).to include("roomNumber" => 529)
      expect(greeting.set_reservation).to include("startTimestamp" => 1486654792)
    end

  end
end
