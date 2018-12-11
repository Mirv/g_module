load 'load_json.rb'

# @data exposed in parent class

class LoadTemplate < LoadJson
  
  def initialize(**args)
    dir = args[:directory] || 'data'
    @file_name = "#{dir}/Templates.json"
    @template = args[:template] || "Default"
    @data = Hash.new
  end
  
  def execute_process
    return unless file = opener(@file_name)
    return unless record = process_json(file)
    return unless record = record_lookup(record, template: @template) 
    @data.merge!({"template" => record['template']})
  end
end