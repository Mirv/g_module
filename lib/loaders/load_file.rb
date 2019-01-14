load 'loaders/load_data.rb'
require 'json'

class LoadFile < LoadData
  attr_reader :result

  def opener(file)
    begin
      file = File.open(file)
      file_contents = file.read
    rescue Errno::ENOENT
      # TODO - inject logger here
      # puts "File not found --- In #{__FILE__} --- '#{file}'"
      return nil
    end
    @result = file_contents
  end
end