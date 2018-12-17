load 'cust_error_location.rb'
load 'assemble_loaders.rb'

class GreetingSystem
  attr_reader :greeting_message, :names, :data
  
  def initialize(**args)
    @names = args
    @data = Hash.new
  end

  ## assemble_loaders
  #
  # In:  @names hash
  # Out: hash exposed via data of user's specific data set
  #
  def assemble_loaders
    loaders =   AssembleLoaders.new(@names)
    loaders.process_loaders
    @names.merge!(loaders.data)
  end
end

