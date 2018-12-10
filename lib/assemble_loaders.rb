require 'json'
load 'load_guest.rb'
load 'load_company.rb'
load 'load_template.rb'

## AssembleLoaders
#
# In:  @names hash of options loaded to select correct data sets from files
#  
#  Assumes names hash if it arrives has validated values from calling object
#
# Out: exposes data which is a hash of the dataset or nil's which top level tests? 
#
class AssembleLoaders
  attr_reader :data
    
  def initialize(**args)
    @names = args
    # @files = args[:files] || ['LoadGuest', 'LoadTemplate', 'LoadCompany']
    # @files = ['LoadGuest']
    # @files << 'LoadTest'
    @files = args[:files] || ['LoadGuest']
    @data = Hash.new
  end

  def process_loaders
    @files.each do |x|
      begin
        obj = Object.const_get(x)
        obj = load_single(obj)
        @data.merge!(obj.data)
      rescue NameError => e
        # inject logfile error here
        puts err_location("Issue locating class interface for #{x}")
        raise(NameError)
      end
    end
  end
  
  def load_single(obj)
    # Loading files and error if not loaded
    file_msg = err_location(
        "Data File not loaded for #{obj.class.name} - ensure path & name were correct")
    raise(ArgumentError, file_msg) unless obj = obj.new(@names)
    obj.execute_process
    # Check all entries in obj exposed data have values
    entry_msg = "Entries missing in #{obj.class.name} file"
    
    # Ensure no blank in hash
    obj.data.each do |x, y|
      raise(ArgumentError, err_location(entry_msg)) if x.nil? || y.nil? || y==""
    end
    
    return obj
  end
  
  # dynamically finds the calling method name & file
  def err_location(msg = "")
    location = "#{caller_name(2)} in #{__FILE__}"
    file_error = "#{msg} in #{location}"
  end
  
  def caller_name(retrieve_line = 1)
    caller[retrieve_line][/`([^']*)'/, 1]
  end
end