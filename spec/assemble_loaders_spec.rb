load 'assemble_loaders.rb'

describe "#intialization" do
end

describe "process_loaders runs" do
  
  context "loads data" do

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
      # expect(AssembleLoaders.new(first: "Candy", last: "Pace", 
      #   template: "t",company: "c", directory: "asdf").data).to be_empty
    end
    
    it "should error if the interface class does not exist" do
      bad_interface = assembler(first: "Candy", last: "Pace", template: "t", 
        company: "c", directory: "lib/data", files: ['LoadGuest','LoadTest'])
      expect{bad_interface.process_loaders}.to raise_error(NameError)
    end
  end
  
  context "load_single runs" do
    let(:good_assembler) { assembler(valid_inputs) }
    
    it "should error if the file is not set properly" do
      # Covered already in LoadFile tests
    end
  
    it "should error if the data has empty hash values" do
      obj = LoadGuest.new(first: "Candy",last: "Pace", directory: 'lib/data')
      obj.data['roomNumber'] = ""
      expect{good_assembler.load_single}.to raise_error(ArgumentError)
    end
  end
end

def valid_inputs
  {first: "Candy", last: "Pace", template: "t", company: "c", directory: "lib/data"}
end

def assembler(values)
  AssembleLoaders.new(values)
end