load 'greet/greeting.rb'

describe "Message initialized" do
  let(:valid) { 
    t = inputs.dup.merge({default_greetings: messages})
    time2greeting(t) 
  }
  
  let(:messages){
    [
      {"message"=>"Good Morning", "start"=>0, "stop"=>10}, 
      {"message"=>"Good Day", "start"=>10, "stop"=>18}, 
      {"message"=>"Good Evening", "start"=>18, "stop"=>24}
    ]
  }
  
  let(:inputs){ {startTimestamp: 1486654792, timezone: "US/Pacific"} }
  
  context "without error" do
    it "should not be default message if valid messages & time" do
      expect(valid).not_to eq("Greetings")
    end
  end
  
  context "given errors" do
    it "should default message if hours or greeting are not valid" do
      # defaults = inputs.dup.merge!({default_greetings: messages})
      # t2g = time2greeting(defaults)
      allow(valid).to receive(:valid?).and_return(false)
      expect(valid.execute_process).to eq("Greetings")
    end
  end
end

def time2greeting(values)
  Greet::Greeting.new(values)
end