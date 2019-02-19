load 'assemble_loaders.rb'

describe "initialized" do
  let(:good_assembler) { assembler(valid_inputs.dup) } 
  
  it "should fail to make new object if first null" do
    expect{ assembler((valid_inputs.dup.merge!(firstName: ""))) 
    }.to raise_error(ArgumentError, "firstName was empty")
  end
  
  it "should fail to make new object if last null" do
    expect{ assembler((valid_inputs.dup.merge!(lastName: ""))) 
    }.to raise_error(ArgumentError, "lastName was empty")
  end

  it "should fail to make new object if company null" do
    expect{ assembler((valid_inputs.dup.merge!(company: "")))
    }.to raise_error(ArgumentError, "company was empty")
  end

end

describe "post run" do
  let(:good_assembler) { assembler(valid_inputs.dup) }
  context "loads data" do

    it "should load data hash with keys" do
      good_assembler.process_loaders
      expect(good_assembler.result).to have_key(:roomNumber)
      expect(good_assembler.result).to have_key(:startTimestamp)
      expect(good_assembler.result).to have_key(:company)
      expect(good_assembler.result).to have_key(:timezone)
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
    firstName: "Morgan", lastName: "Porter", template: "Default", 
    company: "The Grand Budapest Hotel", directory: "lib/data"
  }
end

def assembler(values)
  AssembleLoaders.new(values)
end