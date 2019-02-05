require 'spec_helper.rb'
require 'loaders/load_json.rb'      # file under test
require 'json_requires'     # json setup & testing data

describe ".process_json" do
  let(:json) { jsons = LoadJson.new }
  let(:bad_json) { bad_json = json.process_json(nil) }
  let(:json_template) { json.process_json(json_template_content.to_json) }
  let(:json_guest) { json.process_json(json_guest_content.to_json) }

  context 'process should get file handle' do
    it "should capture error and return nil if not json or string" do
      # expect{bad_json}.to raise_error  
    end
    
    it "process successful should not be nil" do
      expect(json_template).to_not be_nil
    end
  end
end
