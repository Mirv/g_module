require_relative 'hour.rb'
load 'loaders/load_greeting.rb'

## TimeToMessage
#
# In:   user input ...timezone, startTimeStamp.  Loaded via file: greetings
# Opt:  directory to find the files
# Out:  Messages if nothing found otherwise a greeting based on the time
#
class TimeToMessage
  def initialize(args)
    @parameters = args
    default_greetings = args[:default_greetings]
    @hours = retrieve_hours(args)
    @greetings = default_greetings || greetings_file_load
  end
  
  def retrieve_hours(args)
    hours_args = Hash.new
    hours_args.merge!(timezone: args.delete(:timezone))
    hours_args.merge!(startTimestamp: args.delete(:startTimestamp))
    Hour.new(hours_args).time_in_hours  
  end

  def greetings_file_load
    LoadMessage.new(@parameters).execute_process
  end

  def valid?
    @hours && @greetings
  end
  
  def execute_process
    return "Messages" unless valid?
    greetings = Selector.data_from_array_of_hashes(@greetings[:greetings]) 
    greeting_message = greetings.find(@hours).message
  end
end
