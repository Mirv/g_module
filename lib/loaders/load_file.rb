require_relative 'load_data'
require_relative '../logging'

class LoadFile < LoadData
  attr_reader :result

  def opener(file)
    begin
      file = File.open(file)
      file_contents = file.read
    rescue LoadError, Errno::ENOENT
      Logging::LogIt("File not found")
      Logging::LogIt(caller_locations.first)
      raise Error, "File opening error - see logfile in directory of execution."
    end
    @result = file_contents
  end
end