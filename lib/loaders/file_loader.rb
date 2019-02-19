module FileLoader
  def opener(file)
    begin
      file = File.open(file)
      file_contents = file.read
    rescue LoadError, Errno::ENOENT
      Logging::LogIt("File #{file} not found")
      Logging::LogIt(caller_locations.first)
      msg = "File opening error - see logfile in directory of execution."
      raise Errno::ENOENT, msg
    end
    @result = file_contents
  end
end