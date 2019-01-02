load 'greeters/time_in_hours.rb'
load 'loaders/load_greeting.rb'

## TimeToGreeting
#
# In:   timezone, startTimeStamp, greetings
#
#
class TimeToGreeting
  def initialize(args)
    @hours = TimeInHours.new(args).time_in_hours  # check this
    @greetings = args[:default_greetings] || LoadGreeting.new.execute_process #[:greetings]
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
  
  
  #   @greetings =    args[:greetings] 

  # def assign_greeting(hour = 6)
  #   greetings = GreetingSelector.data_from_array_of_hashes(greetings[:greetings])
  #   greeting_message = greetings.find(time_with_zone).message
  #   @data = greeting_message || "Greetings!" 
  # end
  
  # tests
  

    
  
  #     :greetings => [
  #     {"message"=>"Good Morning", "start"=>0, "stop"=>8}, 
  #     {"message"=>"Good Day", "start"=>10, "stop"=>18}, 
  #     {"message"=>"Good Evening", "start"=>18, "stop"=>24}
  #   ]
    
