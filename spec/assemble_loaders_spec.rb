load 'assemble_loaders.rb'

describe "process_loaders runs" do
  let(:good_assembler) { assembler(valid_inputs) } 
  context "loads data" do
    let(:bad_directory) { 
      bad_loader = assembler(valid_inputs.merge!({files: ['LoadImaginary']}))
    }

    it "should load data hash with keys" do
      good_assembler.process_loaders
      expect(good_assembler.data).to have_key("template")
      expect(good_assembler.data).to have_key("roomNumber")
      expect(good_assembler.data).to have_key("startTimestamp")
    end

    it "should error if the interface class does not exist" do
      expect{bad_interface.process_loaders}.to raise_error(NameError)
    end
  end
  
  context "load_single runs" do
    it "should error if the file is not set properly" do
      # Covered already in LoadFile tests
    end
  
    it "should error if the data has empty hash values" do
      obj = LoadGuest.new(valid_inputs)
      obj.execute_process
      obj.data['roomNumber'] = ""
      expect{good_assembler.load_single}.to raise_error(ArgumentError)
    end
  end
end

def valid_inputs
  {
    firstName: "Candy", lastName: "Pace", template: "Default", 
    company: "The Grand Budapest Hotel", directory: "lib/data"
  }
end

def assembler(values)
  AssembleLoaders.new(values)
end