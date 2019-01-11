load 'assemble_loaders.rb'
load 'template_tool.rb'

class MessageSystem
  attr_reader :greeting_message, :names, :data
  
  def initialize(**args)
    @names =    args
    @data =     Hash.new
  end

  ## assemble_loaders
  #
  # In:  @names hash
  # Out: hash exposed via data of user's specific data set - merged to @names
  #
  def assemble_loaders
    loaders = AssembleLoaders.new(@names)
    loaders.process_loaders
    byebug
    @names.merge!(loaders.data)
  end
  
  ## processor_tempalte
  #
  # In:   @names hash with raw template & all the assemble_loader data for message
  # Out:  message to be sent
  #
  def call_templater 
    
  end
end

