require 'json'

module JsonParser
  # Wraps rescue to ensure uniform error handling
  def process_json(source)
    begin
      value = JSON.parse(source, { symbolize_names: true })
    rescue JSON::ParserError, TypeError
      Logging::LogIt("Issue with JSON parsing in...")
      Logging::LogIt(caller_locations.first)
      msg = "JSON error - See Log file in directory of execution." 
      raise JSON::ParserError, msg
    end
    return value
  end
end