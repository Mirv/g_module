# used by record_lookup 
def template_holder
  [
    {
      :id=>1, :name=>"Default", 
      :template=>"{timeMessage} {firstName} {lastName}. Room number {roomNumber} is now available for your use at {company} in {city}.  If you require anything please reach out to us.", 
      :deliminator=>{:start=>"{", :stop=>"}"}}, 
    {
      :id=>2, :name=>"Bond Style", 
      :template=>"{timeMessage} {lastName}, {firstName} {lastName}. Room number {roomNumber} is now available for your use at {company} in {city}.  If you require anything, including a martini - please reach out to us.", 
      :deliminator=>{:start=>"{", :stop=>"}"}
    }
  ] 
end

def guest_holder
  [
    {"firstName": "Candy",   "lastName": "Pace"},
    {"firstName": "Morgan",   "lastName": "Porter"},
    {"firstName": "Bridgett", "lastName": "Richard"}
  ]
end