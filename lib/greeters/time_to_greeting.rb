load 'greeters/time_in_hours.rb'
load 'loaders/load_greeting.rb'

## TimeToGreeting
#
# In:   timezone, startTimeStamp, greetings
# Out:  Greetings if nothing found otherwise a greeting based on the time
#
class TimeToGreeting
  def initialize(args)
    @hours = TimeInHours.new(args).time_in_hours  # check this
    @greetings = args[:default_greetings] || LoadGreeting.new.execute_process
  end

  def valid?
    @hours && @greetings
  end
  
  def process
    return "Greetings" unless valid?
    greetings = GreetingSelector.data_from_array_of_hashes(@greetings) 
    greeting_message = greetings.find(@hours).message
  end
end
