load 'template_assigner.rb'

describe "Assigner" do 
  let(:assigner){
    TemplateAssigner.new(holders, inputs)
  }
  
  context "loads successfully" do
    it "should create object" do
      expect(assigner).to be_truthy
    end
    
    it "should load hashes to be parsed to template" do
      expect{assigner.match_placeholder_to_data}.to_not raise_error 
    end
    
    # it "should generate a message" do
    #   msg = "Good Morning Candy Pace"
    #   expect(assigner.fill_placeholders).to eq(msg)
    # end
  end
  
  context "given there are issues" do
    it "should error if any placeholders have no replacement in template" do
      holders << "Willnotbefound"
      expect{ TemplateAssigner.new(holders, inputs).match_placeholder_to_data 
      }.to raise_error(KeyError)
    end
  end
  
  let(:inputs){
    {
      # mandatory input
      directory: 'lib/data', # tests for rspec don't include subdirs 
      firstName: "Candy", 
      lastName: "Pace", 
      template: "Default",  
      
      # reservation data
      roomNumber: 529, 
      startTimestamp: 1486654792, 
      endTimestamp: 1486852373, 
      
      # template data
      raw_template: "{timeGreeting} {firstName} {lastName}. Room number {roomNumber} is now available for your use at {company} in {city}.  If you require anything please reach out to us.", 
      deliminator: {start: "{", stop: "}" }, 
      
      # company data
      id: 1, 
      company: "Hotel California", 
      city: "Santa Barbara", 
      timezone: "US/Pacific",
      
      # derived and passed in up the chain
      timeGreeting: "Good Morning"
    }
  }
  
  let(:holders){
    ["timeGreeting", "firstName", "lastName", "roomNumber", "company", "city"]
  }
end

