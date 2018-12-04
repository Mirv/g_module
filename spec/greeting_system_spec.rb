load 'greeting_system.rb'

describe "#intialization" do
  context "class initializes" do
    let(:greeting) {  GreetingSystem.new(first: "Candy",last: "Pace", company: "c", template: "d") }
    it "should have first name set" do
      expect(greeting).to be_truthy
    end
    
    it "should fail to make new object if any null values" do
      expect{greeting(first: "")}.to raise_error(ArgumentError)
      expect{greeting(last: "")}.to raise_error(ArgumentError)
      expect{greeting(company: "")}.to raise_error(ArgumentError)
      expect{greeting(template: "")}.to raise_error(ArgumentError)
    end

  end
end