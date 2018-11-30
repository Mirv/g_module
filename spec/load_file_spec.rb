require 'load_file.rb'

describe ".load" do
  context "call to LoadFile class" do
    # ruby dev's use standarderror, as exceptions are system related

    it "should return error" do
      human_error = "non-existant file should cause an error msg"
      expect { LoadFile.load('b','a') }.to raise_error(Errno::ENOENT), human_error
    end
    
    it "should return without an error" do
      human_error = "file should open without issue"
      expect { LoadFile.load('Guests.json') }.to_not raise_error, human_error
      # ruby dev's use standarderror, as exceptions are system related
    end
  end
end