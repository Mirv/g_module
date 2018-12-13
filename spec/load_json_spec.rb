require 'spec_helper.rb'
require 'load_json.rb'      # file under test
require 'json_requires'     # json setup & testing data

describe ".process_json" do
  let(:bad_json_file) { bad_json_file = LoadJson.new.process_json(nil) }
  let(:json_template_file) { 
    json_file = LoadJson.new.process_json(json_template_content.to_json) }
  let(:json_guest_file) { 
    json_file = LoadJson.new.process_json(json_guest_content.to_json) }
  let(:loadjson) { jsons(valid_inputs) }
    
  context 'process should get file handle' do
    it "should capture error and return nil if not json or string" do
      expect(bad_json_file).to be_nil
    end
    
    it "process successful should not be nil" do
      expect(json_template_file).to_not be_nil
    end
    
    it "record_lookup should not be an error on single var matches" do
      expect(loadjson).to_not be_nil
      expect(loadjson.record_lookup(json_template_file, 
      {company: "The Grand Budapest Hotel"})).to_not be_nil    end
    
    it "record_lookup should not be an error on multi var matches" do
      expect(loadjson).to_not be_nil
      expect(loadjson.record_lookup(json_guest_file, 
      {firstName: "Candy", lastName: "Pace"})).to_not be_nil
    end
  end
end


def valid_inputs
  {
    firstName: "Candy", lastName: "Pace", template: "Default", 
    company: "The Grand Budapest Hotel", directory: "lib/data"
  }
end

def jsons(values)
  LoadJson.new
end