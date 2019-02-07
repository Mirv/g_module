require_relative 'load_data'
require 'file_loader'
require 'json_parser'
require 'match_utilities'
require_relative '../logging'

## Loaders
#
# Super class for sharing json handling behavior after loading file
#   
class Loaders < LoadData
  include FileLoader
  include JsonParser
  include MatchUtilities

  
  attr_reader :result

  def retrieve_json
    file = opener(@file_name)  # from file loader class
    process_json(file)
  end
end  




