require "load_data.rb"

describe ".load" do
  context "call to load_data class" do
    it "should return error" do
      err_msg = "Method not implemented in abstract class"
      human_msg = "This class should be extended not called"
      expect { LoadData.load('blah', 'blah') }.to raise_error err_msg, human_msg
      # ruby dev's use standarderror, as exceptions are system related
    end
  end
end
