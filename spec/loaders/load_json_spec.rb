require 'spec_helper.rb'
require 'loaders/loaders'
require 'spec_helpers/json_requires'     # json setup & testing data

include JsonParser

describe ".process_json" do
  # let(:json) { jsons = LoadJson.new }
  # let(:bad_json) { bad_json = json.process_json(nil) }
  let(:bad_json) { bad_json = process_json(nil) }
  let(:json_template) { process_json(json_template_content.to_json) }
  let(:json_guest) { process_json(json_guest_content.to_json) }

  context 'process should get file handle' do
    it "should capture error and return nil if not json or string" do
      expect{json_guest}.to_not raise_error  
    end
    
    it "process successful should not be nil" do
      expect(json_template).to_not be_nil
    end
    
    it "it should error if JSON not made" do
      expect{bad_json}.to raise_error JSON::ParserError
    end
  end
end
