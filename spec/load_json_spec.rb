require 'load_json.rb'
require 'json'

describe ".pulling_json" do
  let(:bad_json_file) { bad_json_file = LoadJson.new.process_json(nil) }
  let(:json_file) { 
    file = LoadFile.new.opener('lib/data/Guests.json')
    json_file = LoadJson.new.process_json(file) 
  }
  
  context 'process should get file handle' do
    it "should capture error and return nil if not json or string" do
      expect(bad_json_file).to be_nil
    end
    
    it "process successful should not be nil" do
      expect(json_file).to_not be_nil
    end
    
    it "record_lookup should not be an error" do
      expect{json_file}.to_not raise_error
    end
  end
end