require 'logger'

module Logging
  ## LogIt
  #
  # Create log file if doesn't exit, otherwise append
  #
  def self.LogIt(msg, log_file = 'greeting.log')
    log = Logger.new(
      File.open(
        File.join(log_file), 
        File::WRONLY | File::APPEND | File::CREAT
      )
    )
    
    log.info(msg)
    log.close
  end
end
