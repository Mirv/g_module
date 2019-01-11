# When loading these into the tests, must call to_json on them before spitting 
# ... thru LoadJson class's process_json

def json_template_content
[ {
		"id": 1,
		"name": "Default",
		"template": "{timeMessage} {firstName} {lastName}. Room number {roomNumber} is now available for your use at {company} in {city}.  If you require anything please reach out to us.",
		"deliminator": {
			"start": "{",
			"stop": "}"
		}
	},
	{
		"id": 2,
		"name": "Bond Style",
		"template": "{timeMessage} {lastName}, {firstName} {lastName}. Room number {roomNumber} is now available for your use at {company} in {city}.  If you require anything, including a martini - please reach out to us.",
		"deliminator": {
			"start": "{",
			"stop": "}"
		}
	}]
end

def json_guest_content
[
  {
    "id": 1,
    "firstName": "Candy",
    "lastName": "Pace",
    "reservation": {
      "roomNumber": 529,
      "startTimestamp": 1486654792,
      "endTimestamp": 1486852373
    }
  },
  {
    "id": 2,
    "firstName": "Morgan",
    "lastName": "Porter",
    "reservation": {
      "roomNumber": 385,
      "startTimestamp": 1486612719,
      "endTimestamp": 1486694720
    }
  }
]
end

def json_company_content
[
  {
    "id": 1,
    "company": "Hotel California",
    "city": "Santa Barbara",
    "timezone": "US/Pacific"
  },
  {
    "id": 2,
    "company": "The Grand Budapest Hotel",
    "city": "Republic of Zubrowka",
    "timezone": "US/Central"
  }
]
end