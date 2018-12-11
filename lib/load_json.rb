load 'load_file.rb'
require 'json'

class LoadJson < LoadFile
  attr_reader :data
  
  # assumes last  entry is the most current TODO - detect multipe entries
  def pull_records(source)
    begin
      value = JSON.parse(source)
    rescue JSON::ParserError, TypeError => e
      # inject logger
      puts "JSON ERROR BEING RESCUED"
      return nil
    end
    return value
  end
end