require_relative 'loaders'
require_relative '../deliminators'
require_relative '../template'

class LoadTemplate < Loaders

  attr_reader :result
  
  def initialize(**args)
    dir =             args[:directory] || 'data'
    file_name =       "#{dir}/Templates.json" 
    @file_name =      args[:file_name] || file_name 
    @template =       args[:template] || "Default"
    @loader_params =  args
    # @result =       Hash.new
  end
  
  # Current - exits if process finds a nil, otherwise merges good result
  def execute_process
    return unless records = retrieve_json
    return unless records = record_lookup(records, name: @template) 
    deliminator = Deliminators.new(
      records[:deliminator][:start], 
      records[:deliminator][:stop]
    )

    @result = Template.new(records[:template], deliminator)
  end
end

