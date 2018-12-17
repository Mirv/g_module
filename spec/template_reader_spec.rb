load 'template_reader.rb'

describe "initialized" do
  let(:template) { templater(valid_template_inputs.dup) }

  it "should have successfully initialized" do
    expect(template).to be_truthy
  end
end

describe "TemplateReader finishes" do
  let(:template) { template_reader(valid_template_inputs.dup) }
  let(:result) {     
    template.read_template
    template.data
  }

  it "should add a hash of variables found to data hash" do
    expect(result[:template_variables].count).to be > 0
  end
  
  it "should add non-nil values to data hash" do
    expect(result[:template_variables].first).to_not be_nil
  end
  
end

def valid_template_inputs
  {
    :raw_template=>"{timeGreeting} {firstName} {lastName}. Room number {roomNumber} is now available for your use at {company} in {city}.  If you require anything please reach out to us.", 
    :deliminator=>{"start"=>"{", "stop"=>"}"}, 
  }
end

def template_reader(values)
  TemplateReader.new(values)
end