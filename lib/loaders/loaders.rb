require_relative 'load_data'
require_relative 'file_loader'
require_relative 'json_parser'
require_relative '../match_utilities'
require_relative '../logging'

## Loaders
#
# Super class for sharing json handling behavior after loading file
#   
class Loaders < LoadData
  include FileLoader
  include JsonParser
  include MatchUtilities
  
  def retrieve_json
    file = opener(@file_name)  # from file loader class
    process_json(file)
  end
end  




