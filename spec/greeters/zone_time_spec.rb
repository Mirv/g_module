require 'greet/zone_time.rb'

describe "initialized" do
  let(:timezone){ Greet::ZoneName.new("US/Central") }
  
  context "worked" do
    it "should be truthy" do
      expect(timezone).to be_truthy
    end
    
    it "should return zone offset" do
      expect(timezone.timezone_offset).to eq(-21600)
    end
  end
  
  context "fails" do
    it "raises error if timezone not string" do
      expect{Greet::ZoneName.new("")}.
      to raise_error(ArgumentError, "timezone was empty")
    end
    
    it "raises error if timezone not string" do
      expect{Greet::ZoneName.new(13)}.
      to raise_error(ArgumentError, "timezone is not valid String")
    end
    
    it "raises error if timezone given isn't real timezone" do
      expect{Greet::ZoneName.new("3")}.
      to raise_error(ArgumentError, "Non-valid TimeZone")
    end
  end
      
end