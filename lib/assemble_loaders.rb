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
    @files = ['LoadGuest']
    @data = Hash.new
  end

  def process_loaders
    # ['LoadGuest','LoadTemplate'].each do |x|
    @files.each do |x|
      obj = Object.const_get(x)
      obj = load_single(obj)
      
      # TOOD - make sure none of the hashes over write each other if adding dynamically
      @data.merge!(obj.data) 
      # puts "Inspect #{obj.class.name} -- #{@data.inspect}"
    end
  end
  
  def load_single(obj)
    # Needs tests
    # Loading files and error if not loaded
    file_msg = err_location(
        "File not loaded for #{obj.class.name} - ensure path & name were correct")
    raise(ArgumentError, file_msg) unless obj = obj.new(@names)

   # Needs tests  
    # Check all entries in obj exposed data have values
    entry_msg = "Entries missing in #{obj.class.name} file"
    obj.data.each do |x, y| 
      raise(ArgumentError, err_location(entry_msg)) unless x && y && y != ""
    end
    
    return obj
  end
  
  # dynamically finds the calling method name & file
  def err_location(msg = "")
    location = "#{caller_name} in #{__FILE__}"
    file_error = "#{msg} in #{location}"
  end
  
  def caller_name
    caller[0][/`([^']*)'/, 1]
  end
end