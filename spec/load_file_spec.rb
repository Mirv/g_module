require 'load_file.rb'

describe ".load" do
  context "call to LoadFile class" do 
    # ruby dev's use standarderror, as exceptions are system related

    it "should error if file does not exist" do
      # expect{LoadFile.load('b','a')}.to raise_error(/ArgumentError/)
      expect{LoadFile.load('b')}.to raise_error(Errno::ENOENT)
    end
    
    it "should return without an error" do
      file = 'lib/data/Guests.json'
      human_error = "working file should not cause an error msg"
      expect { LoadFile.load(file) }.to_not raise_error, human_error
    end
  end
end