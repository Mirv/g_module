require 'loaders/load_json'
require 'match_utilities'

# @result exposed in parent class

class LoadCompany < LoadJson
  include MatchUtilities

  def initialize(**args)
    dir =         args[:directory] || 'data'
    @file_name =  "#{dir}/Company.json"
    @company =    args[:company]
    @result =       Hash.new
  end
  
  # Current - exits if process finds a nil, otherwise merges good result
  def execute_process
    return unless file = opener(@file_name)
    return unless record = process_json(file)
    return unless record = record_lookup(record, company: @company) 
    @result = record
  end
end
