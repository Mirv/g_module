require 'file_loader'

include FileLoader

describe ".load" do
  context "call to LoadFile class" do 

    it "should error if file does not exist" do
      expect{opener('bad')}.to raise_error Errno::ENOENT
    end
    
    it "should return without an error" do
      file = 'lib/data/Guests.json'
      expect { opener(file) }.to_not raise_error 
    end
  end
end