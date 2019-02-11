load 'loaders/deliminators.rb'

describe "Deliminators" do
  let(:delims){ Deliminators.new('{', '}') }
  
  context "loads successfully" do
    it "should be truthy" do
      expect(delims).to be_truthy
    end
  end
  
  context "loads with errors" do
    it "should error if no start deliminator found" do
      expect{ Deliminators.new(nil, '}')
      }.to raise_error(ArgumentError, "Deliminator start was empty")
    end
    
    it "should error if no stop deliminator found" do
      expect{ Deliminators.new('{', nil)
      }.to raise_error(ArgumentError, "Deliminator stop was empty")
    end
  end
end

