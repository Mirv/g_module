require 'load_template.rb'

describe ".load" do
  context "call to LoadTemplate class" do
    it "should return error" do
      human_error = "non-existant file should cause an error msg"
      expect { LoadTemplate.load('b','a') }.to raise_error(Errno::ENOENT), human_error
      # ruby dev's use standarderror, as exceptions are system related
    end
    
    it "should return error" do
      human_error = "file should open without issue"
      expect { LoadTemplate.load }.to_not raise_error, human_error
      # ruby dev's use standarderror, as exceptions are system related
    end
  end
end