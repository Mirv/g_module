require 'loaders/load_json'
require 'match_utilities'

# Load in the guest info from file based on combined name

class LoadGuest < LoadJson
  include MatchUtilities
  
  def initialize(**args)
    dir =         args[:directory] || 'data'
    file_name =   "#{dir}/Guests.json"
    @file_name =  args[:file_name] || file_name
    @first =      args[:firstName] 
    @last =       args[:lastName]
    @result =     Hash.new
  end

  # Current - exits if process finds a nil, otherwise merges good result
  # TODO - execute process could be annonymized by adding a target hash key ...
  def execute_process
    return unless records = retrieve_json
    return unless record = record_lookup(records, firstName: @first, lastName: @last) 
    @result = record[:reservation]
  end
end