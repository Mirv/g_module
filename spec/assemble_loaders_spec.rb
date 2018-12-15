load 'assemble_loaders.rb'

describe "process_loaders runs" do
  let(:good_assembler) { assembler(valid_inputs.dup) } 
  
  context "loads data" do
    let(:bad_directory) { 
      bad_loader = assembler(valid_inputs.dup.merge!({files: ['LoadImaginary']}))
    }

    it "should load data hash with keys" do
      good_assembler.process_loaders
      # byebug
      expect(good_assembler.data).to have_key(:template)
      expect(good_assembler.data).to have_key("roomNumber")
      expect(good_assembler.data).to have_key("startTimestamp")
      expect(good_assembler.data).to have_key("company")
      expect(good_assembler.data).to have_key("timezone")
    end

    it "should error if the interface class does not exist" do
      expect{bad_interface.process_loaders}.to raise_error(NameError)
    end

    it "should load class" do
      obj = Object.const_get('LoadGuest')
      expect(good_assembler.load_single(obj)).to_not be_nil
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