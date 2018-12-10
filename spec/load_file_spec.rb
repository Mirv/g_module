require 'load_file.rb'

describe ".load" do
  context "call to LoadFile class" do 
    # ruby dev's use standarderror, as exceptions are system related

    it "should error if file does not exist" do
      a = LoadFile.new
      expect(a.opener('b')).to be_nil
    end
    
    it "should return without an error" do
      file = 'lib/data/Guests.json'
      a = LoadFile.new
      human_error = "working file should not cause an error msg"
      expect { a.opener(file) }.to_not raise_error, human_error
    end
  end
end