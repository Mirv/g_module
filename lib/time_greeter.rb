require 'byebug'
  # Dir[File.join('greet','*.rb')].sort.each{ |file_name| a = chop_ext(file_name); puts a; require a }
class Greeter
  # Dir[File.join('greet','*.rb')].sort.each{ |file_name| a = (file_name); puts a } 
  # Dir.chdir('greet')
  files = Dir[File.join('*.rb')].sort
  # files.each{ |file_name| file_name; puts file_name; load file_name unless defined?file_name }
  # files.each{ |file_name| load file_name.split('/').second unless defined? file_name }
  puts Dir.pwd
  files.each{ |file_name| load file_name }
  files.each{ |file_name| require_relative file_name }
  
  # LoadEt::Manip.chop_ext
  class Manip
    def self.chop_ext(string)
        string.split(/\./).first
    end
  end
end

# load 'greet/greeting.rb'
# module Greeter
    # include Message
    # include Message
    # include Selector
    # include Hours
    # include Range
    # include Message
    # include TimeZoneNames
# end
