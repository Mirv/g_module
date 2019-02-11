#
## Non-JSON format data for test stub
#
def raw_template_const
  "{timeMessage} {firstName} {lastName}. Room number {roomNumber} is now available for your use at {company} in {city}.  If you require anything please reach out to us."
end


def deliminator_found
  "A delimitor has been found. Possible placeholder issue"
end

def template_assigner_constant
  {
    # mandatory input
    directory: 'lib/data', # tests for rspec don't include subdirs 
    firstName: "Candy", 
    lastName: "Pace", 
    template: "Default",  
    
    # reservation data
    roomNumber: 529, 
    startTimestamp: 1486654792, 
    endTimestamp: 1486852373, 
    
    # template data
    raw_template: raw_template_const, 
    deliminator: Deliminators.new('{','}'), 
    
    # company data
    id: 1, 
    company: "Hotel California", 
    city: "Santa Barbara", 
    timezone: "US/Pacific",
    
    # derived and passed in up the chain
    timeMessage: "Good Morning"
  }
end