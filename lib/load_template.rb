load 'load_json.rb'

# @data exposed in parent class

class LoadTemplate < LoadJson
  
  def initialize(**args)
    dir =             args[:directory] || 'data'
    file_name =       "#{dir}/Templates.json" 
    @file_name =      args[:file_name] || file_name 
    @template =       args[:template] || "Default"
    @loader_params =  args
  end
  
  def execute_process
    return unless file = opener(@file_name)
    return unless record = process_json(file)
    return unless record = record_lookup(record, template: @template) 
    @data = Hash.new
    # byebug
    # @data.merge!({template: record['template']})
    @data.merge!({:template => record['template']})
    @data.merge!({:deliminator => record['deliminator']})
  end
end

