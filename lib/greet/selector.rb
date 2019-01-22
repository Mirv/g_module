# load 'greet/time_greeting.rb'
require_relative 'message'
module Greet
    
  class Selector
    attr_reader :greetings
    def self.data_from_array_of_hashes(a)
      new(a.map { |h| Greet::Message.data_from_hash(h) })
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
      Greet::Message.new("Greetings", Range.new(0, 24))
    end
  end
end