require 'loaders/load_file'
require 'json'

class LoadJson < LoadFile
  attr_reader :result
  
  def process_json(source)
    begin
    # byebug
      value = JSON.parse(source, { symbolize_names: true })
    rescue JSON::ParserError, TypeError => e
      # TODO -- inject logger
      #  "JSON ERROR BEING RESCUED"
      return nil
    end
    return value
  end
end  




