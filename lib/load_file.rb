load 'load_data.rb'
require 'json'

class LoadFile < LoadData
  attr_reader :data

  def opener(file)
    begin
      file = File.open(file)
      file_contents = file.read
    rescue Errno::ENOENT
      # TODO - inject logger here
      # puts "File not found --- In #{__FILE__} --- '#{file}'"
      return nil
    end
    return file_contents
  end
end