load 'load_json.rb'

# @data exposed in parent class

class LoadCompany < LoadJson

  def initialize(**args)
    dir =         args[:directory] || 'data'
    @file_name =  "#{dir}/Company.json"
    @company =    args[:company]
    @data =       Hash.new
  end
  
  def execute_process
    return unless file = opener(@file_name)
    return unless record = process_json(file)
    return unless record = record_lookup(record, company: @company) 
    @data = record
  end
end
