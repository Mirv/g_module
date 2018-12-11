load 'load_json.rb'

class LoadTemplate < LoadJson
  def initialize(**args)
    @dir = args[:directory] || 'data'
    @template = args[:template]
    @data = Hash.new
  end
  
  def execute_process
    return unless file = opener("#{@dir}/Templates.json")
    return unless record = pull_records(file)
    return unless record = record_lookup(record) 
    @data.merge!({"template" => record['template']})
  end
  
  def opener(file = 'data/Templates.json')
    super
  end
  
  def pull_records(source)
    super
  end
  
  def record_lookup(data, template = "Default")
    record = data.find {|x| x["name"] == template} 
    return record
  end
end