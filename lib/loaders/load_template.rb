require_relative 'loaders'
require_relative 'deliminators'

class LoadTemplate < Loaders

  attr_reader :result
  
  def initialize(**args)
    dir =             args[:directory] || 'data'
    file_name =       "#{dir}/Templates.json" 
    @file_name =      args[:file_name] || file_name 
    @template =       args[:template] || "Default"
    @loader_params =  args
    @result =       Hash.new
  end
  
  # Current - exits if process finds a nil, otherwise merges good result
  def execute_process
    return unless records = retrieve_json
    return unless record = record_lookup(records, name: @template) 
    @result = {}

    deliminator = Deliminators.new(
      record[:deliminator][:start], 
      record[:deliminator][:stop]
    )
    
    @result.merge!({raw_template: record[:template]})
    @result.merge!({deliminator: deliminator})
  end
end

