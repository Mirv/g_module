load 'loaders/load_json.rb'
require 'byebug'
# @result exposed in parent class

class LoadTemplate < LoadJson
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
  # TODO - execute process could be annonymized by adding a target hash key ...
  def execute_process
    return unless file = opener(@file_name)
    return unless record = process_json(file)

    return unless record = record_lookup(record, name: @template) 
    @result = {}
    
    @result.merge!({raw_template: record[:template]})
    @result.merge!({deliminator: record[:deliminator]})
  end
end

