require 'json'
load 'load_guest.rb'
load 'load_company.rb'
load 'load_template.rb'

class GreetingSystem
  attr_reader :greeting_message, :data
  
  def initialize(**args)
    # generic non-explicit args list for flexibilty
    
    # Explicit pre checks 
    # pre lookup checks - as "" as value in hash is not valid, incorrectly
    raise ArgumentError, "First Name was empty" if args[:first].empty?
    raise ArgumentError, "Last Name was empty" if args[:last].empty?
    raise ArgumentError, "Company Name was empty" if args[:company].empty?
    raise ArgumentError, "Template Name was empty" if args[:template].empty?
    
    @names = args
    @data = Hash.new
    # Begin deriving values from external sources
    # @reservation = set_reservation(@names[:directory]) 
  end
  
  def set_reservation(directory)
    LoadGuest.new(
      @names[:first], 
      @names[:last], 
      directory) unless directory.nil?
  end

  def hand_process
    process = Hash.new
    # ['LoadGuest', 'LoadTemplate', 'LoadCompany'].each do |x|
    # ['LoadGuest','LoadTemplate'].each do |x|
    ['LoadGuest'].each do |x|
      puts "#{x.inspect}"
      obj = Object.const_get(x)
      
    # Needs tests
      # Loading files and error if not loaded
      file_msg = err_location("File not loaded for #{x} - ensure path & name were correct")
      raise(ArgumentError, file_msg) unless obj = obj.new(@names)
    
     # Needs tests  
      # Check all entries in obj exposed data have values
      entry_msg = "Entries missing in #{obj.class.name} file"
      obj.data.each do |x, y| 
        # y = nil
        # ruby has no #blank? / #empty? / #present? like rails
        raise(ArgumentError, err_location(entry_msg)) unless x && y && y != ""
      end
      
      @data.merge!(obj.data) 
      puts "Inspect #{obj.class.name} -- #{@data.inspect}"
    end
  end
  
  ## Setter_decoupler (duck-type caller)
  # - '#load' should oads all the data to be used based on user input
  #   Currently: 
  #     guest (first/last/room/time)
  #     company (hotel, city for timezone)
  #     template (format to output)
  # - Each class extending FileLoad has it's own default file string
  # - Each object should expose a data var to save into G.S obj
  #
  # def setter_decoupler(objects)
    
  #   object

  # end
  
  # def arg_err
  
  # dynamically finds the calling method name & file
  def err_location(msg = "")
    location = "#{caller_name} in #{__FILE__}"
    file_error = "#{msg} in #{location}"
  end
  
  def caller_name
    caller[0][/`([^']*)'/, 1]
  end
  
end