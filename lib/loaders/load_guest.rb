load 'loaders/load_json.rb'

# Load in the guest info from file based on combined name

class LoadGuest < LoadJson
  
  def initialize(**args)
    dir =         args[:directory] || 'data'
    file_name =   "#{dir}/Guests.json"
    @file_name =  args[:file_name] || file_name
    @first =      args[:firstName] 
    @last =       args[:lastName]
  end

  def execute_process
    return unless file = opener(@file_name)
    return unless record = process_json(file)
    return unless record = record_lookup(record, firstName: @first, lastName: @last) 
    @data = record['reservation']
  end

end
# 