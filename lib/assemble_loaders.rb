load 'cust_error_location.rb'
load 'load_guest.rb'
load 'load_company.rb'
load 'load_template.rb'
require 'byebug'

## AssembleLoaders
#
# In:  @names hash of options loaded to select correct data sets from files
#  
#  Assumes names hash if it arrives has validated values from calling object
#
# Out: exposes data which is a hash of the dataset or nil's which top level tests? 
#
class AssembleLoaders
  include CustErrorLocation
  
  attr_reader :data
  
  def initialize(**args)
    @names =    args
    @files =    args[:files] || ['LoadGuest', 'LoadTemplate', 'LoadCompany']
    # @files =    args[:files] || ['LoadGuest', ]

    @data =     Hash.new
  end

  def process_loaders
    @files.each do |x|
      begin
        obj = Object.const_get(x)
        obj = load_single(obj)
      rescue NameError => e
        # inject logfile error here
        # puts err_location("Issue locating class interface for #{x}", 2)
        # raise(NameError)
      end
      @data.merge!(obj.data)
    end
  end
  
  def load_single(obj)
    # Loading files and error if not loaded
    obj_name = obj.class.name
    msg = "Data File not loaded #{obj_name} - ensure path & name were correct"
    file_msg = err_location(msg, 2)
    raise(ArgumentError, file_msg) unless obj = obj.new(@names)
    obj.execute_process
    
    # Check all entries in obj exposed data have values
    entry_msg = "Entries missing in #{obj_name} file"
    # Ensure no blank in hash
    obj.data.each do |x, y|
      raise(ArgumentError, err_location(entry_msg)) if !y || y && y==""
    end
    return obj
  end
  

end