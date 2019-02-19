require 'spec_helpers/record_lookup_files'
require 'template'

describe "Template object" do
  let(:raw_template){ template_holder.first[:template] } 
  let(:template){ Template.new(raw_template.dup, deliminator)}
  let(:deliminator){ delim = instance_double('deliminator', start: '{', stop: '}')}

  
  context "initializes" do
    it "should start with no error" do
      expect{template}.to_not raise_error
    end
    
    it "should start with no error" do
      expect(template).to be_truthy
    end
    
    it "should raise error if no placeholders found" do
      invalid_raw  =  "blah" 
      expect{ Template.new(invalid_raw, deliminator).pull_holders
      }.to raise_error(ArgumentError, "No placeholders found in template")
    end
    
    it "should raise error if no blank found" do
      invalid_raw  =  "" 
      expect{ Template.new(invalid_raw, deliminator).read_template
      }.to raise_error(ArgumentError, "Template string blank")
    end
  end
end
