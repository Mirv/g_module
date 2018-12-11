load 'load_json.rb'

class LoadCompany < LoadJson
  attr_reader :data

  def initialize(**args)
    @dir = args[:directory] || 'data'
    @company = args[:company]
    @data = Hash.new
  end
  
  def execute_process
    return unless file = opener("#{@dir}/Company.json")
    return unless record = pull_records(file)
    return unless record = record_lookup(record, @company) 
    @data = record
  end
  
  def opener(directory = 'data/Company.json')
    super
  end

  def record_lookup(data, company = "Hotel California")
    # Might be multiple - TODO - adjust to allow if multiple hotels
    record = data.find {|x| x["company"] == company} 
    return record
  end
end
