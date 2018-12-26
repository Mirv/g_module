class GreetingSelector
  attr_reader :greetings
  def self.data_from_array_of_hashes(a)
    new(a.map { |h| Greeting.data_from_hash(h) })
  end

  def initialize(greetings)
    greetings = greetings 
    @greetings = greetings + [default_greeting]
  end
  
  def find(hour)
    @greetings.find do |greeting|
      greeting.in_effect?(hour)
    end
  end
  
  private
  
  def default_greeting
    Greeting.new("Greetings", TimeRange.new(0, 24))
  end
end