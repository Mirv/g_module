require 'load_json.rb'
require 'json'

describe ".pulling_json" do
  let(:bad_json_file) { 
    bad_json_file = LoadJson.new.pull_records(nil) }
  
  context 'process should get file handle' do
    it "should error if not json or string" do
      expect(bad_json_file).to be_nil
    end
  end
end