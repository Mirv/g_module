require_relative 'load_file'
require 'json'

class LoadJson < LoadFile
  attr_reader :result
  
  def process_json(source)
    begin
      value = JSON.parse(source, { symbolize_names: true })
    rescue JSON::ParserError, TypeError
      Logging::LogIt("Issue with JSON parsing in...")
      Logging::LogIt(caller_locations.first)
      raise error, "JSON error - See Log file in directory of execution." 
    end
    return value
  end
end  




