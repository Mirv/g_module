require 'spec_helper.rb'
require 'load_json.rb'      # file under test
require 'json_requires'     # json setup & testing data

describe ".process_json" do
  let(:json) { jsons = LoadJson.new}
  let(:bad_json) { bad_json = json.process_json(nil) }
  let(:json_template) { json.process_json(json_template_content.to_json) }
  let(:json_guest) { json.process_json(json_guest_content.to_json) }

  context 'process should get file handle' do
    it "should capture error and return nil if not json or string" do
      expect(bad_json).to be_nil
    end
    
    it "process successful should not be nil" do
      expect(json_template).to_not be_nil
    end
    
    it "record_lookup should not be an error on single variable matches" do
      expect(json.record_lookup(
        json_template, {company: "The Grand Budapest Hotel"})).to_not be_nil    
    end
    
    it "record_lookup should not be an error on multi variable matches" do
      expect(json.record_lookup(
        json_guest, {firstName: "Candy", lastName: "Pace"})).to_not be_nil
    end
  end
end
