require_relative 'loaders'

class LoadCompany < Loaders

  attr_reader :result

  def initialize(**args)
    dir =         args[:directory] || 'data'
    @file_name =  "#{dir}/Company.json"
    @company =    args[:company]
    @result =       Hash.new
  end
  
  # Current - exits if process finds a nil, otherwise merges good result
  def execute_process
    return unless records = retrieve_json
    return unless record = record_lookup(records, company: @company) 
    @result = record
  end
end
