require 'loaders/load_json'

class LoadTemplate < LoadJson
  include MatchUtilities

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
    return unless file = opener(@file_name)
    return unless record = process_json(file)
    return unless record = record_lookup(record, name: @template) 
    @result = {}

    deliminator = Deliminators.new(
      record[:deliminator][:start], 
      record[:deliminator][:stop]
    )
    
    @result.merge!({raw_template: record[:template]})
    @result.merge!({deliminator: deliminator})
  end
end

