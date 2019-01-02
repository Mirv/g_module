# load 'template_tool.rb'

# describe "template initialized" do

#   let(:template) { templater(valid_template_inputs.dup) }
#   context "successfully initialized" do
#     it "should have a working object" do
#       expect(template).to be_truthy
#     end
    
#     it "should retrieve a daycycle greeting" do
#       expect(template.retrieve_time(valid_template_inputs)).to be_truthy
#     end
#   end
  
#   context "given there are issues" do
#     let(:bad_template) { 
#       bad = valid_template_inputs.dup
#       bad[:placeholders] = {missing: "notFound"}
#       templater(bad) 
#     }
    
#     it "should error if any placeholders have no replacement in template" do
#       expect{ bad_template.matched? }.to raise_error(KeyError)
#     end
#   end
# end


# describe "finishes running" do
#   let(:template) { templater(valid_template_inputs.dup) }
#   let(:result) {     
#     template.data
#   }

#   # it "should add a hash of variables found to :template_variables data hash" do
#   #   puts result
#   #   # byebug
#   #   expect(result).to_not be_empty
#   # end
  
#   # it "should add a hash of variables found to :template_variables data hash" do
#   #   expect(result).to include(:timeGreeting)
#   # end
# end

# def valid_template_inputs
#   {
#     # mandatory input
#     firstName: "Candy", 
#     lastName: "Pace", 
#     template: "Default",  
    
#     # reservation data
#     directory: "lib/data",
#     roomNumber: 529, 
#     startTimestamp: 1486654792, 
#     endTimestamp: 1486852373, 
    
#     # template data
#     raw_template: "{timeGreeting} {firstName} {lastName}. Room number {roomNumber} is now available for your use at {company} in {city}.  If you require anything please reach out to us.", 
#     deliminator: {start: "{", stop: "}" }, 
    
#     # company data
#     id: 1, 
#     company: "Hotel California", 
#     city: "Santa Barbara", 
#     timezone: "US/Pacific"
#   }
# end

# def templater(values)
#   TemplateTool.new(values)
# end