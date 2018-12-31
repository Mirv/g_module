load 'loaders/load_json.rb'

# @data exposed in parent class

class LoadTemplate < LoadJson
  
  def initialize(**args)
    dir =             args[:directory] || 'data'
    file_name =       "#{dir}/Templates.json" 
    @file_name =      args[:file_name] || file_name 
    @template =       args[:template] || "Default"
    @loader_params =  args
    
  end
  
  # Current - exits if process finds a nil, otherwise merges good result
  # TODO - execute process could be annonymized by adding a target hash key ...
  def execute_process
    return unless file = opener(@file_name)
    return unless record = process_json(file)
    return unless record = record_lookup(record, template: @template) 

    @data = Hash.new
    @data.merge!({raw_template: record[:template]})
    @data.merge!({deliminator: record[:deliminator]})
  end
end

