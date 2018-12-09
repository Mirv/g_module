load 'assemble_loaders.rb'

describe "#intialization" do
end

describe "loading all files" do
  
  context "into data" do

    let(:good_assembler) { assembler(valid_inputs) }
    let(:bad_directory) { AssembleLoaders.new(first: "Candy", last: "Pace", 
        template: "t",company: "c", directory: "asdf") }

    it "should load reservation hash with key roomNumber" do
      good_assembler.process_loaders
      expect(good_assembler.data).to have_key("roomNumber")
    end
    
    it "should load reservation hash with key startTimestamp" do
      good_assembler.process_loaders
      expect(good_assembler.data).to have_key("startTimestamp")
    end

    it "should have valid roomNumber" do
      good_assembler.process_loaders
      expect(good_assembler.data['roomNumber']).to be > 0
    end
    
    it "should have valid roomNumber" do
      good_assembler.process_loaders
      expect(good_assembler.data['startTimestamp']).to be > 0
    end
    
    it "should have data hash empty if file doesn't load" do
      expect(AssembleLoaders.new(first: "Candy", last: "Pace", 
        template: "t",company: "c", directory: "asdf").data).to be_empty
    end
  end
end

def valid_inputs
  {first: "Candy", last: "Pace", template: "t", company: "c", directory: "lib/data"}
end

def assembler(values)
  AssembleLoaders.new(values)
end